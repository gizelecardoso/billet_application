class AddApiIdToBilletPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :billet_payments, :api_id, :integer
  end
end
