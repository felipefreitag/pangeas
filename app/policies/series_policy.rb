# frozen_string_literal: true

class SeriesPolicy < ApplicationPolicy
  def initialize(user, series)
    @user = user
    @subscription = user.subscriptions.first
    @series = series
  end

  def show?
    @subscription&.state == 'active'
  end
end
