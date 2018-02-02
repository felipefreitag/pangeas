# frozen_string_literal: true

class Purchase < ApplicationRecord
  validates :user, presence: true
  validates :course, presence: true

  belongs_to :user
  belongs_to :course

  def pay(invoice_id)
    update_attributes(paid: true, invoice_id: invoice_id)
  end
end
