# frozen_string_literal: true

class Subsection < ApplicationRecord
  validates :section, presence: true
  validates :name, presence: true
  belongs_to :section

  has_many :categories, dependent: :restrict_with_exception
  has_many :courses, dependent: :restrict_with_exception
end
