# frozen_string_literal: true

require "test_helper"

module Api
  module Printful
    class ProductTest < ActionDispatch::IntegrationTest
      test "printful product api works" do
        VCR.use_cassette("printful_product") do
          product_id = 81_975_784
          products_response = Api::Printful::Product.perform(product_id)

          assert response: 200
          assert_equal 200, products_response["code"]
          assert products_response["result"].present?
        end
      end
    end
  end
end
