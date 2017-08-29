class Series < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :category
end
