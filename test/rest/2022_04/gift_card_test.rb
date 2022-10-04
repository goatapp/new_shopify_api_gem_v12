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

class GiftCard202204Test < Test::Unit::TestCase
  def setup
    super

    test_session = NewShopifyAPI::Auth::Session.new(id: "id", shop: "test-shop.myshopify.io", access_token: "this_is_a_test_token")
    NewShopifyAPI::Context.activate_session(test_session)
    modify_context(api_version: "2022-04")
  end

  def teardown
    super

    NewShopifyAPI::Context.deactivate_session
  end

  sig do
    void
  end
  def test_1()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"gift_cards" => [{"id" => 1035197676, "balance" => "100.00", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "currency" => "USD", "initial_value" => "100.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => nil, "template_suffix" => nil, "last_characters" => "0d0d", "order_id" => nil}, {"id" => 766118925, "balance" => "25.00", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "currency" => "USD", "initial_value" => "50.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => "2021-10-03", "template_suffix" => nil, "last_characters" => "0e0e", "order_id" => nil}, {"id" => 10274553, "balance" => "0.00", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "currency" => "USD", "initial_value" => "50.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => nil, "template_suffix" => nil, "last_characters" => "0y0y", "order_id" => nil}]}), headers: {})

    NewShopifyAPI::GiftCard.all

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json")
  end

  sig do
    void
  end
  def test_2()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json?status=enabled")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"gift_cards" => [{"id" => 766118925, "balance" => "25.00", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "currency" => "USD", "initial_value" => "50.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => "2021-10-03", "template_suffix" => nil, "last_characters" => "0e0e", "order_id" => nil}, {"id" => 10274553, "balance" => "0.00", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "currency" => "USD", "initial_value" => "50.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => nil, "template_suffix" => nil, "last_characters" => "0y0y", "order_id" => nil}]}), headers: {})

    NewShopifyAPI::GiftCard.all(
      status: "enabled",
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json?status=enabled")
  end

  sig do
    void
  end
  def test_3()
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "gift_card" => hash_including({"initial_value" => 25.0}) }
      )
      .to_return(status: 200, body: JSON.generate({"gift_card" => {"id" => 1063936316, "balance" => "25.00", "created_at" => "2022-10-03T12:50:53-04:00", "updated_at" => "2022-10-03T12:50:53-04:00", "currency" => "USD", "initial_value" => "25.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => 755357713, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => nil, "template_suffix" => nil, "last_characters" => "ce2g", "order_id" => nil, "code" => "b72c6222b9chce2g"}}), headers: {})

    gift_card = NewShopifyAPI::GiftCard.new
    gift_card.initial_value = 25.0
    gift_card.save

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json")
  end

  sig do
    void
  end
  def test_4()
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "gift_card" => hash_including({"note" => "This is a note", "initial_value" => 100.0, "code" => "ABCD EFGH IJKL MNOP", "template_suffix" => "gift_cards.birthday.liquid"}) }
      )
      .to_return(status: 200, body: JSON.generate({"gift_card" => {"id" => 1063936319, "balance" => "100.00", "created_at" => "2022-10-03T12:51:09-04:00", "updated_at" => "2022-10-03T12:51:09-04:00", "currency" => "USD", "initial_value" => "100.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => 755357713, "user_id" => nil, "customer_id" => nil, "note" => "This is a note", "expires_on" => nil, "template_suffix" => "gift_cards.birthday.liquid", "last_characters" => "mnop", "order_id" => nil, "code" => "abcdefghijklmnop"}}), headers: {})

    gift_card = NewShopifyAPI::GiftCard.new
    gift_card.note = "This is a note"
    gift_card.initial_value = 100.0
    gift_card.code = "ABCD EFGH IJKL MNOP"
    gift_card.template_suffix = "gift_cards.birthday.liquid"
    gift_card.save

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards.json")
  end

  sig do
    void
  end
  def test_5()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"gift_card" => {"id" => 1035197676, "balance" => "100.00", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "currency" => "USD", "initial_value" => "100.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => nil, "template_suffix" => nil, "last_characters" => "0d0d", "order_id" => nil}}), headers: {})

    NewShopifyAPI::GiftCard.find(
      id: 1035197676,
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676.json")
  end

  sig do
    void
  end
  def test_6()
    stub_request(:put, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "gift_card" => hash_including({"note" => "Updating with a new note"}) }
      )
      .to_return(status: 200, body: JSON.generate({"gift_card" => {"note" => "Updating with a new note", "template_suffix" => nil, "initial_value" => "100.00", "balance" => "100.00", "customer_id" => nil, "id" => 1035197676, "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:50:58-04:00", "currency" => "USD", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "expires_on" => nil, "last_characters" => "0d0d", "order_id" => nil}}), headers: {})

    gift_card = NewShopifyAPI::GiftCard.new
    gift_card.id = 1035197676
    gift_card.note = "Updating with a new note"
    gift_card.save

    assert_requested(:put, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676.json")
  end

  sig do
    void
  end
  def test_7()
    stub_request(:put, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "gift_card" => hash_including({"expires_on" => "2020-01-01"}) }
      )
      .to_return(status: 200, body: JSON.generate({"gift_card" => {"expires_on" => "2020-01-01", "template_suffix" => nil, "initial_value" => "100.00", "balance" => "100.00", "customer_id" => nil, "id" => 1035197676, "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:51:03-04:00", "currency" => "USD", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "note" => nil, "last_characters" => "0d0d", "order_id" => nil}}), headers: {})

    gift_card = NewShopifyAPI::GiftCard.new
    gift_card.id = 1035197676
    gift_card.expires_on = "2020-01-01"
    gift_card.save

    assert_requested(:put, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676.json")
  end

  sig do
    void
  end
  def test_8()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/count.json?status=enabled")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"count" => 3}), headers: {})

    NewShopifyAPI::GiftCard.count(
      status: "enabled",
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/count.json?status=enabled")
  end

  sig do
    void
  end
  def test_9()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/count.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"count" => 3}), headers: {})

    NewShopifyAPI::GiftCard.count

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/count.json")
  end

  sig do
    void
  end
  def test_10()
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676/disable.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "gift_card" => hash_including({"id" => 1035197676}) }
      )
      .to_return(status: 200, body: JSON.generate({"gift_card" => {"disabled_at" => "2022-10-03T12:50:50-04:00", "template_suffix" => nil, "initial_value" => "100.00", "balance" => "100.00", "customer_id" => nil, "id" => 1035197676, "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:50:50-04:00", "currency" => "USD", "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "note" => nil, "expires_on" => nil, "last_characters" => "0d0d", "order_id" => nil}}), headers: {})

    gift_card = NewShopifyAPI::GiftCard.new
    gift_card.id = 1035197676
    gift_card.disable(
      body: {"gift_card" => {"id" => 1035197676}},
    )

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/1035197676/disable.json")
  end

  sig do
    void
  end
  def test_11()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/search.json?query=last_characters%3Amnop")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"gift_cards" => [{"id" => 1063936318, "balance" => "10.00", "created_at" => "2022-10-03T12:51:07-04:00", "updated_at" => "2022-10-03T12:51:07-04:00", "currency" => "USD", "initial_value" => "10.00", "disabled_at" => nil, "line_item_id" => nil, "api_client_id" => nil, "user_id" => nil, "customer_id" => nil, "note" => nil, "expires_on" => nil, "template_suffix" => nil, "last_characters" => "mnop", "order_id" => nil}]}), headers: {})

    NewShopifyAPI::GiftCard.search(
      query: "last_characters:mnop",
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-04/gift_cards/search.json?query=last_characters%3Amnop")
  end

end
