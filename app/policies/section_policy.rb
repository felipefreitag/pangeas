# frozen_string_literal: true

class SectionPolicy < ApplicationPolicy
  def initialize(user, section)
    @user = user
    @subscription = user.subscriptions.first
    @section = section
  end

  def index?
    @subscription&.state == 'active'
  end

  def show?
    @subscription&.state == 'active'
  end
end
