# frozen_string_literal: true

class Series < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :category
  has_many :videos, dependent: :restrict_with_exception

  def image
    @image ||= image_url ? image_url : videos.order(:created_at).first.image_url
  end
end
