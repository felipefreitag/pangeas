# frozen_string_literal: true

class VideoPolicy < ApplicationPolicy
  def initialize(user, video)
    @user = user
    @subscription = user.subscriptions.first
    @video = video
  end

  def show?
    @subscription&.state == 'active'
  end
end
