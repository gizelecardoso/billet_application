class CreateBilletPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :billet_payments do |t|
      t.float :amount
      t.integer :status

      t.timestamps
    end
  end
end
