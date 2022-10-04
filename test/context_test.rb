# typed: true
# frozen_string_literal: true

require_relative "./test_helper"

module NewShopifyAPITest
  class ContextTest < Minitest::Test
    def setup
      @reader, writer = IO.pipe
      NewShopifyAPI::Context.setup(
        api_key: "key",
        api_secret_key: "secret",
        api_version: "unstable",
        host_name: "host",
        scope: ["scope1", "scope2"],
        is_private: true,
        is_embedded: true,
        session_storage: NewShopifyAPI::Auth::FileSessionStorage.new,
        logger: Logger.new(writer),
        private_shop: "privateshop.myshopify.com",
        user_agent_prefix: "user_agent_prefix1",
        old_api_secret_key: "old_secret",
      )
    end

    def test_not_setup
      clear_context
      refute(NewShopifyAPI::Context.setup?)
    end

    def test_setup
      assert(NewShopifyAPI::Context.setup?)
      assert_equal("key", NewShopifyAPI::Context.api_key)
      assert_equal("secret", NewShopifyAPI::Context.api_secret_key)
      assert_equal("unstable", NewShopifyAPI::Context.api_version)
      assert_equal("host", NewShopifyAPI::Context.host_name)
      assert_equal(NewShopifyAPI::Auth::AuthScopes.new(["scope1", "scope2"]), NewShopifyAPI::Context.scope)
      assert(NewShopifyAPI::Context.private?)
      assert_equal(NewShopifyAPI::Auth::FileSessionStorage.new, NewShopifyAPI::Context.session_storage)
      NewShopifyAPI::Context.logger.info("test log")
      assert_match(/test log/, @reader.gets)
      assert_equal("privateshop.myshopify.com", NewShopifyAPI::Context.private_shop)
      assert_equal("user_agent_prefix1", NewShopifyAPI::Context.user_agent_prefix)
      assert_equal("old_secret", NewShopifyAPI::Context.old_api_secret_key)
    end

    def test_active_session_is_thread_safe
      session1 = NewShopifyAPI::Auth::Session.new(shop: "test-shop2.myshopify.com", access_token: "token1")
      session2 = NewShopifyAPI::Auth::Session.new(shop: "test-shop2.myshopify.com", access_token: "token2")

      session1_set = T.let(false, T::Boolean)
      session2_set = T.let(false, T::Boolean)

      threads = []

      threads << Thread.new do
        NewShopifyAPI::Context.activate_session(session1)
        session1_set = true

        sleep(0.1) until session2_set

        assert_equal(session1, NewShopifyAPI::Context.active_session)
      end

      threads << Thread.new do
        NewShopifyAPI::Context.activate_session(session2)
        session2_set = true

        sleep(0.1) until session1_set

        assert_equal(session2, NewShopifyAPI::Context.active_session)
      end

      threads.each(&:join)
    end

    def test_active_session_defaults_to_private_session
      assert_equal("privateshop.myshopify.com", T.must(NewShopifyAPI::Context.active_session).shop)
      assert_equal("secret", T.must(NewShopifyAPI::Context.active_session).access_token)
    end

    def test_active_session_defaults_to_nil
      clear_context
      assert_nil(NewShopifyAPI::Context.active_session)
    end

    def test_deactivate_session
      clear_context
      session = NewShopifyAPI::Auth::Session.new(shop: "test-shop.myshopify.com", access_token: "token")

      NewShopifyAPI::Context.activate_session(session)
      assert_instance_of(NewShopifyAPI::Auth::Session, NewShopifyAPI::Context.active_session)

      NewShopifyAPI::Context.deactivate_session
      assert_nil(NewShopifyAPI::Context.active_session)
    end

    def test_unsupported_api_version
      assert_raises(NewShopifyAPI::Errors::UnsupportedVersionError) do
        NewShopifyAPI::Context.setup(
          api_key: "key",
          api_secret_key: "secret",
          api_version: "unsupported",
          host_name: "host",
          scope: ["scope1", "scope2"],
          is_private: false,
          is_embedded: true,
          session_storage: NewShopifyAPI::Auth::FileSessionStorage.new,
          logger: Logger.new($stdout),
        )
      end
    end

    def teardown
      NewShopifyAPI::Context.deactivate_session
    end

    private

    def clear_context
      NewShopifyAPI::Context.setup(
        api_key: "",
        api_secret_key: "",
        api_version: "unstable",
        host_name: "",
        scope: [],
        is_private: false,
        is_embedded: true,
        session_storage: NewShopifyAPI::Auth::FileSessionStorage.new,
        user_agent_prefix: nil,
        old_api_secret_key: nil,
      )
    end
  end
end
