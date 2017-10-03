# frozen_string_literal: true

class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    is_admin?
  end

  def new?
    create?
  end

  def update?
    is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    is_admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  protected

  def admin?
    user.try(:admin?) || false
  end

  def owner_or_admin?
    owned_by?(user) || is_admin?
  end

  def owned_by?(user)
    user.present? && record.user == user
  end
end
