# frozen_string_literal: true

require "test_helper"

module Api
  module Printful
    class ProductsTest < ActionDispatch::IntegrationTest
      test "printful products api works" do
        VCR.use_cassette("printful_products") do
          products_response = Api::Printful::Products.perform

          assert response: 200
          assert_equal 200, products_response["code"]
          assert products_response["result"].present?
        end
      end
    end
  end
end
