# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.boolean :paid, null: false, default: false
      t.string :invoice_id
      t.references :user, foreign_key: true, index: true
      t.references :course, foreign_key: true, index: true

      t.timestamps
    end
  end
end
