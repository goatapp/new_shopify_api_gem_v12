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

class Webhook202207Test < Test::Unit::TestCase
  def setup
    super

    test_session = NewShopifyAPI::Auth::Session.new(id: "id", shop: "test-shop.myshopify.io", access_token: "this_is_a_test_token")
    NewShopifyAPI::Context.activate_session(test_session)
    modify_context(api_version: "2022-07")
  end

  def teardown
    super

    NewShopifyAPI::Context.deactivate_session
  end

  sig do
    void
  end
  def test_1()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json?since_id=901431826")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"webhooks" => [{"id" => 1014196360, "address" => "https://example.org/app_uninstalled", "topic" => "app/uninstalled", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}]}), headers: {})

    NewShopifyAPI::Webhook.all(
      since_id: "901431826",
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json?since_id=901431826")
  end

  sig do
    void
  end
  def test_2()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"webhooks" => [{"id" => 4759306, "address" => "https://apple.com", "topic" => "orders/create", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}, {"id" => 892403750, "address" => "https://example.org/fully_loaded_1", "topic" => "orders/cancelled", "created_at" => "2021-12-01T05:23:43-05:00", "updated_at" => "2021-12-01T05:23:43-05:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}, {"id" => 901431826, "address" => "https://apple.com/uninstall", "topic" => "app/uninstalled", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}, {"id" => 1014196360, "address" => "https://example.org/app_uninstalled", "topic" => "app/uninstalled", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}]}), headers: {})

    NewShopifyAPI::Webhook.all

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
  end

  sig do
    void
  end
  def test_3()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/count.json?topic=orders%2Fcreate")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"count" => 1}), headers: {})

    NewShopifyAPI::Webhook.count(
      topic: "orders/create",
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/count.json?topic=orders%2Fcreate")
  end

  sig do
    void
  end
  def test_4()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/count.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"count" => 4}), headers: {})

    NewShopifyAPI::Webhook.count

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/count.json")
  end

  sig do
    void
  end
  def test_5()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/4759306.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({"webhook" => {"id" => 4759306, "address" => "https://apple.com", "topic" => "orders/create", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:44:45-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}}), headers: {})

    NewShopifyAPI::Webhook.find(
      id: 4759306,
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/4759306.json")
  end

  sig do
    void
  end
  def test_6()
    stub_request(:put, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/4759306.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "webhook" => hash_including({"address" => "https://somewhere-else.com/"}) }
      )
      .to_return(status: 200, body: JSON.generate({"webhook" => {"id" => 4759306, "address" => "https://somewhere-else.com/", "topic" => "orders/create", "created_at" => "2022-10-03T12:44:45-04:00", "updated_at" => "2022-10-03T12:55:11-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}}), headers: {})

    webhook = NewShopifyAPI::Webhook.new
    webhook.id = 4759306
    webhook.address = "https://somewhere-else.com/"
    webhook.save

    assert_requested(:put, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/4759306.json")
  end

  sig do
    void
  end
  def test_7()
    stub_request(:delete, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/4759306.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: JSON.generate({}), headers: {})

    NewShopifyAPI::Webhook.delete(
      id: 4759306,
    )

    assert_requested(:delete, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks/4759306.json")
  end

  sig do
    void
  end
  def test_8()
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "webhook" => hash_including({"address" => "pubsub://projectName:topicName", "topic" => "customers/update", "format" => "json"}) }
      )
      .to_return(status: 200, body: JSON.generate({"webhook" => {"id" => 7226364925, "address" => "pubsub://projectName:topicName", "topic" => "customers/update", "created_at" => "2022-10-03T12:59:17-04:00", "updated_at" => "2022-10-03T12:59:17-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}}), headers: {})

    webhook = NewShopifyAPI::Webhook.new
    webhook.address = "pubsub://projectName:topicName"
    webhook.topic = "customers/update"
    webhook.format = "json"
    webhook.save

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
  end

  sig do
    void
  end
  def test_9()
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "webhook" => hash_including({"topic" => "orders/create", "address" => "https://example.hostname.com/", "format" => "json", "fields" => ["id", "note"]}) }
      )
      .to_return(status: 200, body: JSON.generate({"webhook" => {"id" => 7226364934, "address" => "https://example.hostname.com/", "topic" => "orders/create", "created_at" => "2022-10-03T13:00:26-04:00", "updated_at" => "2022-10-03T13:00:26-04:00", "format" => "json", "fields" => ["id", "note"], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}}), headers: {})

    webhook = NewShopifyAPI::Webhook.new
    webhook.topic = "orders/create"
    webhook.address = "https://example.hostname.com/"
    webhook.format = "json"
    webhook.fields = [
      "id",
      "note"
    ]
    webhook.save

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
  end

  sig do
    void
  end
  def test_10()
    stub_request(:post, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "webhook" => hash_including({"address" => "arn:aws:events:us-east-1::event-source/aws.partner/shopify.com/755357713/example-event-source", "topic" => "customers/update", "format" => "json"}) }
      )
      .to_return(status: 200, body: JSON.generate({"webhook" => {"id" => 7226364946, "address" => "arn:aws:events:us-east-1::event-source/aws.partner/shopify.com/755357713/example-event-source", "topic" => "customers/update", "created_at" => "2022-10-03T13:02:11-04:00", "updated_at" => "2022-10-03T13:02:11-04:00", "format" => "json", "fields" => [], "metafield_namespaces" => [], "api_version" => "unstable", "private_metafield_namespaces" => []}}), headers: {})

    webhook = NewShopifyAPI::Webhook.new
    webhook.address = "arn:aws:events:us-east-1::event-source/aws.partner/shopify.com/755357713/example-event-source"
    webhook.topic = "customers/update"
    webhook.format = "json"
    webhook.save

    assert_requested(:post, "https://test-shop.myshopify.io/admin/api/2022-07/webhooks.json")
  end

end
