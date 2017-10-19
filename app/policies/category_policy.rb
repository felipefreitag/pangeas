# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  def initialize(user, category)
    @user = user
    @subscription = user.subscriptions.first
    @category = category
  end

  def show?
    @subscription&.state == 'active'
  end
end
