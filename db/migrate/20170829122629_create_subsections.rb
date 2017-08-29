class CreateSubsections < ActiveRecord::Migration[5.1]
  def change
    create_table :subsections do |t|
      t.references :section, null: false, foreign_key: true, index: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
