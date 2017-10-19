# frozen_string_literal: true

class VideoPolicy < ApplicationPolicy
  def initialize(user, video)
    @user = user
    @video = video
  end

  def show?
    @user.subscribed?
  end
end
