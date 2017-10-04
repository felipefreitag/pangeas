# frozen_string_literal: true

class Section < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  has_many :subsections, dependent: :restrict_with_exception
end
