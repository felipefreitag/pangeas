# frozen_string_literal: true

class Video < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :vimeo_id, presence: true
  validates :image_url, presence: true

  belongs_to :category, optional: true
  belongs_to :series, optional: true
end
