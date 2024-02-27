# frozen_string_literal: true

# Migration responsible for add expires_at in table billet_payment in the database
class AddExpireAtToBilletPayment < ActiveRecord::Migration[7.1]
  def change
    add_column :billet_payments, :expire_at, :date
  end
end
