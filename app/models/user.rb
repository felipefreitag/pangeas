# frozen_string_literal: true

class User < ApplicationRecord
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  )

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :subscriptions, dependent: :restrict_with_exception

  def subscribed?
    @subscribed ||= subscriptions.with_state(:active).count.positive?
  end

  def subscription
    subscriptions.order(:created_at).last
  end
end
