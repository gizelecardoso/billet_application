# frozen_string_literal: true

# Migration responsible for add association to customer on billet_payment table in the database
class AddCustomerToBilletPayment < ActiveRecord::Migration[7.1]
  def change
    add_reference :billet_payments, :customer, null: false, foreign_key: true
  end
end
