# frozen_string_literal: true

class VideoPolicy < ApplicationPolicy
  def show?
    user.subscribed?
  end
end
