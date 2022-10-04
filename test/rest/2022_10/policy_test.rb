# typed: strict
# frozen_string_literal: true

########################################################################################################################
# This file is auto-generated. If you have an issue, please create a GitHub issue.                                     #
########################################################################################################################

$VERBOSE = nil
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "minitest/autorun"
require "webmock/minitest"

require "shopify_api"
require_relative "../../test_helper"

class Policy202210Test < Test::Unit::TestCase
  def setup
    super

    test_session = NewShopifyAPI::Auth::Session.new(id: "id", shop: "test-shop.myshopify.io", access_token: "this_is_a_test_token")
    NewShopifyAPI::Context.activate_session(test_session)
    modify_context(api_version: "2022-10")
  end

  def teardown
    super

    NewShopifyAPI::Context.deactivate_session
  end

  sig do
    void
  end
  def test_1()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-10/policies.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"policies" => [{"body" => "You have 30 days to get a refund", "created_at" => "2022-10-03T12:52:45-04:00", "updated_at" => "2022-10-03T12:52:45-04:00", "handle" => "refund-policy", "title" => "Refund policy", "url" => "https://jsmith.myshopify.com/548380009/policies/878590288"}]}), headers: {})

    NewShopifyAPI::Policy.all

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-10/policies.json")
  end

end
