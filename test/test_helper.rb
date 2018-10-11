# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "vcr"

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def login(user)
      post login_url, params: { email: user.email }
    end

    VCR.configure do |config|
      config.cassette_library_dir = "test/vcr_cassettes"
      config.hook_into :webmock
    end
  end
end
