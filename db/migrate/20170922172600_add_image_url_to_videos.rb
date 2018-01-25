# frozen_string_literal: true

class AddImageUrlToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :image_url, :string
  end
end
