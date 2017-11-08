class AddAffiliateTagToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :affiliate_tag, :string
  end
end
