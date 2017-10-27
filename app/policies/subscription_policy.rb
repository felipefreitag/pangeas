# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def initialize(user, subscription)
    @user = user
    @series = subscription
  end

  def new?
    true
  end
end
