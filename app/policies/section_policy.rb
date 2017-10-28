# frozen_string_literal: true

class SectionPolicy < ApplicationPolicy
  def initialize(user, section)
    @user = user
    @section = section
  end

  def index?
    @user.subscribed?
  end

  def show?
    @user.subscribed?
  end
end
