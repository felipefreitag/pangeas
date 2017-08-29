class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

 validates :first_name, presence: true
 validates :last_name, presence: true

 has_many :subscriptions

 def subscribed?
   @subscribed ||= subscriptions.with_state(:active).count > 0
 end
end
