# frozen_string_literal: true

require "test_helper"

module Syncs
  class ProductsTest < ActionDispatch::IntegrationTest
    test "perform will sync products" do
      VCR.use_cassette("sync_products") do
        assert_difference "Product.count", 6 do
          Sync::Products.perform
        end
      end
    end

    test "perform will sync product variants" do
      VCR.use_cassette("sync_products") do
        assert_difference "ProductVariant.count", 194 do
          Sync::Products.perform
        end
      end
    end

    test "perform will sync variant files" do
      VCR.use_cassette("sync_products") do
        assert_difference "VariantFile.count", 40 do
          Sync::Products.perform
        end
      end
    end
  end
end
