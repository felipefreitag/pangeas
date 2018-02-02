# frozen_string_literal: true

class ChangeImageUrlNotNullOnVideos < ActiveRecord::Migration[5.1]
  def change
    change_column_null :videos, :image_url, false
  end
end
