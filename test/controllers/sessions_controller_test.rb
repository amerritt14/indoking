# frozen_string_literal: true

require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login(users(:admin))
  end

  test "should get new" do
    get login_url
    assert_response :success
  end
end
