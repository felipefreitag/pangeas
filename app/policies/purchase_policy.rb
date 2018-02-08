# frozen_string_literal: true

class PurchasePolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    user
  end
end
