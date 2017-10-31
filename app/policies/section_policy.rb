# frozen_string_literal: true

class SectionPolicy < ApplicationPolicy
  def index?
    user.subscribed?
  end

  def show?
    user.subscribed?
  end
end
