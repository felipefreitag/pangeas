# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :user, presence: true
  validates :recurrence, presence: true

  belongs_to :user

  state_machine initial: :pending do
    state :pending
    state :rejected
    state :active
    state :inactive
    state :canceled

    event :reject do
      transition pending: rejected
    end

    event :activate do
      transition %i[pending inactive] => :active
    end

    event :deactivate do
      transition ative: inactive
    end

    event :cancel do
      transition ative: canceled
    end

    before_transition any => :active do |subscription|
      subscription.activated_at = Time.current
    end
  end
end
