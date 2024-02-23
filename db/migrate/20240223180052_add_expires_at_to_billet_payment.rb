# frozen_string_literal: true

# Migration responsible for add expires_at in table billet_payment in the database
class AddExpiresAtToBilletPayment < ActiveRecord::Migration[7.1]
  def change
    add_column :billet_payments, :expires_at, :date
  end
end
