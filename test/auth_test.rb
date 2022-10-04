# typed: false
# frozen_string_literal: true

require_relative "./test_helper"

module NewShopifyAPITest
  class AuthTest < Test::Unit::TestCase
    def setup
      super
      @host = "some-shopify-store.myshopify.com/admin"
      @encoded_host = Base64.strict_encode64(@host)
    end

    def test_valid_host
      assert_equal(
        NewShopifyAPI::Auth.embedded_app_url(@encoded_host),
        "https://#{@host}/apps/#{NewShopifyAPI::Context.api_key}",
      )
    end

    def test_no_host
      assert_raises(NewShopifyAPI::Errors::MissingRequiredArgumentError) do
        NewShopifyAPI::Auth.embedded_app_url(nil)
      end
    end

    def test_context_not_setup
      modify_context(api_key: "", api_secret_key: "", host_name: "")

      assert_raises(NewShopifyAPI::Errors::ContextNotSetupError) do
        NewShopifyAPI::Auth.embedded_app_url(@encoded_host)
      end
    end
  end
end
