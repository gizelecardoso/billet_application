module BilletPayments
  class Create
    include Interactor

    def call
      context.billet_payment_json[:api_id] = context.bank_billet["id"]
      context.billet_payment_json[:customer] = context.customer

      context.billet_payment = BilletPayment.create!(context.billet_payment_json.slice(:amount, :expire_at, :api_id, :customer))
    end
  end
end
