# typed: strict
# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "oj"
require "sorbet-runtime"
require "securerandom"
require "cgi"
require "uri"
require "openssl"
require "httparty"
require "zeitwerk"
require "jwt"
require "concurrent"

require_relative "new_shopify_api/inflector"
require_relative "new_shopify_api/admin_versions"

loader = Zeitwerk::Loader.for_gem
loader.inflector = NewShopifyAPI::Inflector.new(__FILE__)
loader.ignore("#{__dir__}/shopify_api/rest/resources")
loader.setup
