# frozen_string_literal: true

# rubocop:disable Rails/ReversibleMigration
class ChangeCountryNullOnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :country, true
    change_column_default :users, :country, ''
  end
end
# rubocop:enable Rails/ReversibleMigration
