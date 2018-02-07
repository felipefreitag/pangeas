# frozen_string_literal: true

class VideoPolicy < ApplicationPolicy
  def index?
    user.subscribed? || user.courses?
  end

  def show?
    return user.subscribed? unless record.course
    user.courses.include? record.course
  end
end
