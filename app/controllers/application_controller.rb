# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # Pundit validations. Ensures policy is checked on every controller
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
