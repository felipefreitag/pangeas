# frozen_string_literal: true

class VideoPolicy < ApplicationPolicy
  def index?
    user.subscribed?
  end

  def show?
    user.subscribed?
  end
end
