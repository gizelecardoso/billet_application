# frozen_string_literal: true

# Migration responsible for add api_id to billet_payment table in the database
class AddApiIdToBilletPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :billet_payments, :api_id, :integer
  end
end
