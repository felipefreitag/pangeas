class Category < ApplicationRecord
  validates :subsection, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :subsection
  has_many :videos
  has_many :series

  def latest_video
    @latest_video ||= @videos.order(:created_at).last
  end
end
