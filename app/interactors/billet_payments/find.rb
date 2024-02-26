module BilletPayments
  class Find
    include Interactor

    def call
      context.billet_payments = BilletPayment.find(context.billet_payment_id)
    end
  end
end
