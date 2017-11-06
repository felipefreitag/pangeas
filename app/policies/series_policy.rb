# frozen_string_literal: true

class SeriesPolicy < ApplicationPolicy
  def show?
    user.subscribed?
  end
end
