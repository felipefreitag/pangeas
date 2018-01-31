# frozen_string_literal: true

class Course < ApplicationRecord
  validates :subsection, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :vimeo_id, presence: true
  validates :image_url, presence: true
  validates :instructor, presence: true
  validates :credentials, presence: true
  validates :price, presence: true
  validates :discount_price, presence: true

  belongs_to :subsection
  has_many :purchases, dependent: :restrict_with_exception
  has_many :users, through: :purchases, dependent: :restrict_with_exception
  has_many :videos, dependent: :restrict_with_exception
  has_many :series, dependent: :restrict_with_exception
end
