# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    owner_or_admin?
  end

  def create?
    admin?
  end

  def new?
    create?
  end

  def update?
    admin?
  end

  def edit?
    update?
  end

  def destroy?
    admin?
  end

  protected

  def admin?
    user.try(:admin?) || false
  end

  def owner_or_admin?
    owned_by?(user) || admin?
  end

  def owned_by?(user)
    user.present? && record.user == user
  end
end
