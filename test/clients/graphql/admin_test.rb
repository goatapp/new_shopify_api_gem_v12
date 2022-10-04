# typed: false
# frozen_string_literal: true

require_relative "../../test_helper.rb"

module NewShopifyAPI
  module Clients
    module Graphql
      class AdminTest < Test::Unit::TestCase
        include TestHelpers::GraphQLClient

        def setup
          super
          @session = NewShopifyAPI::Auth::Session.new(shop: "test-shop.myshopify.com",
            access_token: SecureRandom.alphanumeric(10))
          @client = NewShopifyAPI::Clients::Graphql::Admin.new(session: @session)
          @path = "admin/api"
          @expected_headers = TestHelpers::Constants::DEFAULT_CLIENT_HEADERS.merge({
            "X-Shopify-Access-Token": @session.access_token,
          })
        end
      end
    end
  end
end
