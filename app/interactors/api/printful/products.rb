# frozen_string_literal: true

module Api
  module Printful
    class Products < Base
      private

      def endpoint_path
        "sync/products"
      end
    end
  end
end
