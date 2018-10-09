# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # Pundit validations. Ensures policy is checked on every controller
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  helper_method :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
    # Gracefully handle situations where a user is deleted while still logged in
    session[:user_id] = nil unless @current_user
    @current_user
  end
end
