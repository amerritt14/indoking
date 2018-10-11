# frozen_string_literal: true

require "test_helper"

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:admin)
      login(@user)
    end

    test "should create user" do
      assert_difference("User.count") do
        post admin_users_url, params: { user: {
          first_name: "New", last_name: "User", email: "new@user.com", password: "password"
        } }
      end

      assert_redirected_to root_url
    end

    test "should get edit" do
      get edit_admin_user_url(@user)
      assert_response :success
    end

    test "should update user" do
      patch admin_user_url(@user), params: {
        user: { first_name: @user.first_name, last_name: @user.last_name, email: @user.email }
      }
      assert_redirected_to admin_user_url(@user)
    end

    test "should destroy user" do
      assert_difference("User.count", -1) do
        delete admin_user_url(@user)
      end

      assert_redirected_to admin_users_url
    end
  end
end
