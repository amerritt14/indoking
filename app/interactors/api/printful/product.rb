# frozen_string_literal: true

module Api
  module Printful
    class Product < Base
      attr_reader :id

      def initialize(id)
        @id = id
      end

      def self.perform(id)
        new(id).perform
      end

      private

      def endpoint_path
        "sync/products/#{id}"
      end
    end
  end
end
