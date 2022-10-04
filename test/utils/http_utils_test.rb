# typed: false
# frozen_string_literal: true

require_relative "../test_helper"

module NewShopifyAPITest
  module Utils
    class HttpUtilsTest < Minitest::Test
      def test_normalize_headers
        normalized_headers = NewShopifyAPI::Utils::HttpUtils.normalize_headers({ "HTTP_AUTHORIZATION" => "jwt" })
        assert_equal({ "authorization" => "jwt" }, normalized_headers)
      end
    end
  end
end
