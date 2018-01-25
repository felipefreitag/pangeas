# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :category, foreign_key: true, index: true
      t.references :series, foreign_key: true, index: true
      t.text :name, null: false
      t.text :description, null: false
      t.integer :vimeo_id, null: false
      t.text :information
      t.text :synopsys
      t.text :bio
      t.boolean :highlighted, null: false, default: false
      t.integer :sorting

      t.timestamps
    end
  end
end
# rubocop:enable Metrics/MethodLength
