# frozen_string_literal: true

class Category < ApplicationRecord
  validates :subsection, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :subsection
  has_many :videos, dependent: :restrict_with_exception
  has_many :series, dependent: :restrict_with_exception

  def highlight
    @highlight ||=
      series.find_by(highlighted: true) || videos.find_by(highlighted: true)
  end
end
