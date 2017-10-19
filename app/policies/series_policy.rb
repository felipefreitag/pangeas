# frozen_string_literal: true

class SeriesPolicy < ApplicationPolicy
  def initialize(user, series)
    @user = user
    @series = series
  end

  def show?
    @user.subscribed?
  end
end
