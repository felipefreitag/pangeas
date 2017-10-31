# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  def show?
    user.subscribed?
  end
end
