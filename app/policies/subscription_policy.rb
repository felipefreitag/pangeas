# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def initialize(user, subscription)
    @user = user
    @series = subscription
  end

  def new?
    true
  end

  def create?
    true
  end
end
