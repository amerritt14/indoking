# frozen_string_literal: true

module Api
  module Printful
    class Base
      require "net/http"
      require "net/https"

      API_KEY = YAML.load_file("config/printful.yml")["api_key"]
      ENDPOINT_URL = YAML.load_file("config/printful.yml")["endpoint_url"]

      def self.perform
        new.perform
      end

      def perform
        uri(endpoint_path)# initialize uri
        response = http.start do |http|
          http.request(api_request)
        end
        JSON.parse(response.body)
      end

      private

      def http
        return @http if @http
        @http = Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = true
        @http
      end

      def api_request
        return @api_request if @api_request
        @api_request = Net::HTTP::Get.new(uri.path)
        @api_request.add_field("Authorization", "Basic " + Base64.encode64(API_KEY).chomp)
        @api_request
      end

      def uri(path = "")
        @uri ||= URI.parse(ENDPOINT_URL + path)
      end

      def endpoint_path
        raise NotImplementedError
      end
    end
  end
end
