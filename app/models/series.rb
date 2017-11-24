# frozen_string_literal: true

class Series < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :category
  has_many :videos, dependent: :restrict_with_exception

  def image
    @image ||= image_url ? image_url : first_video_image
  end

  private

  def first_video_image
    video = videos.order(:sorting).first
    video.present? ? video.image_url : nil
  end
end
