# typed: strict
# frozen_string_literal: true

########################################################################################################################
# This file is auto-generated. If you have an issue, please create a GitHub issue.                                     #
########################################################################################################################

$VERBOSE = nil
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "minitest/autorun"
require "webmock/minitest"

require "new_shopify_api"
require_relative "../../test_helper"

class AndroidPayKey202210Test < Test::Unit::TestCase
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
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-10/android_pay_keys.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "android_pay_key" => hash_including({}) }
      )
      .to_return(status: 200, body: JSON.generate({"android_pay_key" => {"id" => 964811894, "public_key" => "BPI5no5liIrAC3knvJnxSoMW09D0KwbJOnv+TaAmd3Fur3wYlD85yFaJABZC\n1qb/14GtM+616y8SrKwaVOSu4U8=\n"}}), headers: {})

    android_pay_key = NewShopifyAPI::AndroidPayKey.new

    android_pay_key.save

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-10/android_pay_keys.json")
  end

  sig do
    void
  end
  def test_2()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-10/android_pay_keys/964811895.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"android_pay_key" => {"id" => 964811895, "public_key" => "BPI5no5liIrAC3knvJnxSoMW09D0KwbJOnv+TaAmd3Fur3wYlD85yFaJABZC\n1qb/14GtM+616y8SrKwaVOSu4U8=\n"}}), headers: {})

    NewShopifyAPI::AndroidPayKey.find(
      id: 964811895,
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-10/android_pay_keys/964811895.json")
  end

  sig do
    void
  end
  def test_3()
    stub_request(:delete, "https://test-shop.myshopify.io/admin/api/2022-10/android_pay_keys/964811896.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({}), headers: {})

    NewShopifyAPI::AndroidPayKey.delete(
      id: 964811896,
    )

    assert_requested(:delete, "https://test-shop.myshopify.io/admin/api/2022-10/android_pay_keys/964811896.json")
  end

end
