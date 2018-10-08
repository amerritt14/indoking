# frozen_string_literal: true

class PrintfulApi
  require "net/http"
  require "net/https"

  API_KEY = YAML.load_file('config/printful.yml')["api_key"]


  def products
    request = build_products_request
    response = http.start do |http|
      http.request(request)
    end
    puts response.body
  end

  private

  def build_products_request
    request = Net::HTTP::Get.new(products_uri.path)
    request.add_field("Authorization", "Basic " + Base64.encode64(API_KEY).chomp)
    request
  end

  def products_uri
    @uri ||= URI.parse("https://api.printful.com/products")
  end

  def http
    return @http if @http
    @http = Net::HTTP.new(products_uri.host, products_uri.port)
    @http.use_ssl = true
    @http
  end
end
