# frozen_string_literal: true

class AddAffiliateTagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :affiliate_tag, :string
  end
end
