class Category < ApplicationRecord
  validates :subsection, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :subsection
end
