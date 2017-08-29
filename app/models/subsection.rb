class Subsection < ApplicationRecord
  validates :section, presence: true
  validates :name, presence: true
  belongs_to :section
end
