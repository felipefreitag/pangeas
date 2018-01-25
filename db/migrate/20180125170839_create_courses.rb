# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :subsection, null: false, foreign_key: true, index: true
      t.text :name, null: false
      t.text :description, null: false
      t.text :class_detail, null: false
      t.integer :vimeo_id, null: false
      t.text :image_url, null: false
      t.text :instructor, null: false
      t.text :credentials, null: false
      t.text :price, null: false
      t.text :discount_price, null: false

      t.timestamps
    end
  end
end
# rubocop:enable Metrics/MethodLength
