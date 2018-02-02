# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :subsection, null: false, foreign_key: true, index: true
      t.text :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
