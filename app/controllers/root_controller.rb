# frozen_string_literal: true
class RootController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, except: :index

  def index
  end
end
