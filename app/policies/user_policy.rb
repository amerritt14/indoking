# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    true
  end
end
