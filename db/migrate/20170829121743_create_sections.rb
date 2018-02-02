# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.text :image_url, null: false

      t.timestamps
    end
  end
end
