# frozen_string_literal: true

require "test_helper"

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:admin)
    end

    test "should get index" do
      get users_url
      assert_response :success
    end

    test "should get new" do
      get new_user_url
      assert_response :success
    end

    test "should create user" do
      assert_difference("User.count") do
        post users_url, params: { user: { first_name: @user.first_name, last_name: @user.last_name, uuid: @user.uuid } }
      end

      assert_redirected_to user_url(User.last)
    end

    test "should show user" do
      get admin_user_url(@user)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_user_url(@user)
      assert_response :success
    end

    test "should update user" do
      patch admin_user_url(@user), params: {
        user: { first_name: @user.first_name, last_name: @user.last_name, uuid: @user.uuid }
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
