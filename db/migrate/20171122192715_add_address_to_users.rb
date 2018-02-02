# frozen_string_literal: true

class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cpf, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :address_number, :string, null: false
    add_column :users, :address_complement, :string
    add_column :users, :neighborhood, :string
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :country, :string, null: false
    add_column :users, :zip_code, :string, null: false
  end
end
