class AddExpiresAtToBilletPayment < ActiveRecord::Migration[7.1]
  def change
    add_column :billet_payments, :expires_at, :date
  end
end
