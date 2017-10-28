# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  def initialize(user, category)
    @user = user
    @category = category
  end

  def show?
    @user.subscribed?
  end
end
