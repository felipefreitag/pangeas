# frozen_string_literal: true

class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def watch?
    return unless user
    user.purchased? record
  end
end
