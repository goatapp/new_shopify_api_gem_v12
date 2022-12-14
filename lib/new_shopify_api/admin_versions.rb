# typed: strict
# frozen_string_literal: true

module NewShopifyAPI
  module AdminVersions
    SUPPORTED_ADMIN_VERSIONS = T.let([
      "unstable",
      "2022-10",
      "2022-07",
      "2022-04",
      "2022-01",
    ], T::Array[String])

    LATEST_SUPPORTED_ADMIN_VERSION = T.let("2022-10", String)
  end

  SUPPORTED_ADMIN_VERSIONS = NewShopifyAPI::AdminVersions::SUPPORTED_ADMIN_VERSIONS
  LATEST_SUPPORTED_ADMIN_VERSION = NewShopifyAPI::AdminVersions::LATEST_SUPPORTED_ADMIN_VERSION
end
