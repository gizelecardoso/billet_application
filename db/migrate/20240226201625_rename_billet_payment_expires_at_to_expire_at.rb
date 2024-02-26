class RenameBilletPaymentExpiresAtToExpireAt < ActiveRecord::Migration[7.1]
  def change
    rename_column :billet_payments, :expires_at, :expire_at
  end
end
