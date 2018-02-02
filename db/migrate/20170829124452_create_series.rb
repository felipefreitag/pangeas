# frozen_string_literal: true

class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.references :category, null: false, foreign_key: true, index: true
      t.text :name, null: false
      t.text :description, null: false
      t.boolean :highlighted, null: false, default: false
      t.integer :sorting

      t.timestamps
    end
  end
end
