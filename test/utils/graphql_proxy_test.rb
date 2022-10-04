# typed: false
# frozen_string_literal: true

require_relative "../test_helper"

module NewShopifyAPITest
  module Utils
    class GraphqlProxyTest < Test::Unit::TestCase
      def setup
        super

        @access_token = SecureRandom.alphanumeric(10)
        @session = NewShopifyAPI::Auth::Session.new(
          id: "id", shop: "testshop.myshopify.com", access_token: @access_token, is_online: true,
        )
        @cookies = { "shopify_app_session" => "id" }
        NewShopifyAPI::Context.session_storage.store_session(@session)

        @client = NewShopifyAPI::Clients::Graphql::Admin.new(session: @session)
      end

      def test_proxy_query_application_json
        NewShopifyAPI::Clients::Graphql::Admin.expects(:new).with(session: @session).returns(@client)

        body = JSON.dump({ query: "query string", variables: { foo: :bar } })

        @client.expects(:query)
          .with(query: "query string", variables: { "foo" => "bar" }, tries: 1)
          .returns(NewShopifyAPI::Clients::HttpResponse.new(code: 200, body: "", headers: {}))

        NewShopifyAPI::Utils::GraphqlProxy.proxy_query(
          headers: { "content_type" => "application/json" }, body: body, cookies: @cookies,
        )
      end

      def test_proxy_query_application_graphql
        NewShopifyAPI::Clients::Graphql::Admin.expects(:new).with(session: @session).returns(@client)
        @client.expects(:query)
          .with(query: "query string", tries: 1)
          .returns(NewShopifyAPI::Clients::HttpResponse.new(code: 200, body: "", headers: {}))

        NewShopifyAPI::Utils::GraphqlProxy.proxy_query(
          headers: { "content_type" => "application/graphql" }, body: "query string", cookies: @cookies,
        )
      end

      def test_proxy_query_private_app
        modify_context(is_private: true)
        assert_raises(NewShopifyAPI::Errors::PrivateAppError) do
          NewShopifyAPI::Utils::GraphqlProxy.proxy_query(headers: {}, body: "")
        end
      end

      def test_proxy_query_no_session
        modify_context(session_storage: TestHelpers::FakeSessionStorage.new)

        assert_raises(NewShopifyAPI::Errors::SessionNotFoundError) do
          NewShopifyAPI::Utils::GraphqlProxy.proxy_query(headers: {}, body: "", cookies: @cookies)
        end
      end

      def test_proxy_query_missing_from_json_body
        assert_raises(NewShopifyAPI::Errors::InvalidGraphqlRequestError) do
          NewShopifyAPI::Utils::GraphqlProxy.proxy_query(
            headers: { "content_type" => "application/json" }, body: "{}", cookies: @cookies,
          )
        end
      end

      def test_proxy_query_invalid_content_type
        assert_raises(NewShopifyAPI::Errors::InvalidGraphqlRequestError) do
          NewShopifyAPI::Utils::GraphqlProxy.proxy_query(
            headers: { "content_type" => "application/bad" }, body: "", cookies: @cookies,
          )
        end
      end
    end
  end
end
