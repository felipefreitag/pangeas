# frozen_string_literal: true

class Video < ApplicationRecord
  include PgSearch

  pg_search_scope :search,
    against: %i[name description information synopsys bio]

  validates :name, presence: true
  validates :description, presence: true
  validates :vimeo_id, presence: true
  validates :image_url, presence: true

  belongs_to :category, optional: true
  belongs_to :series, optional: true
  belongs_to :course, optional: true
end
