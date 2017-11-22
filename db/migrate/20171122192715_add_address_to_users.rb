class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cpf, :string
    add_column :users, :address, :string
    add_column :users, :address_number, :string
    add_column :users, :address_complement, :string
    add_column :users, :neighborhood, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :zip_code, :string
  end
end
