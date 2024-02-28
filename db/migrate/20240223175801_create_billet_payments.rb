# frozen_string_literal: true

# Migration responsible for create billet_payments table in the database
class CreateBilletPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :billet_payments do |t|
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
