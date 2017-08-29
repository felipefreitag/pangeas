class Video < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :vimeo_id, presence: true

  belongs_to :category
  belongs_to :series
end
