# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin? || false
  end

  def show?
    user.admin? || false
  end

  def create?
    user.admin? || false
  end

  def new?
    create?
  end

  def update?
    user.admin? || false
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
