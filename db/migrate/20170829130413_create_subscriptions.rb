# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TYPE subscription_recurrence AS ENUM ('monthly', 'anual');
      CREATE TYPE subscription_state AS ENUM ('pending', 'rejected', 'active', 'inactive', 'canceled');
    SQL
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.column :state, :subscription_state, null: false, default: 'pending'
      t.column :recurrence, :subscription_recurrence, null: false
      t.string :payment_method
      t.timestamp :activated_at

      t.timestamps
    end
  end

  def down
    drop_table :subscriptions
    execute <<-SQL
      DROP TYPE subscription_recurrence;
      DROP TYPE subscription_state;
    SQL
  end
end
# rubocop:enable Metrics/MethodLength
