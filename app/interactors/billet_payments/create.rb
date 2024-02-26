module BilletPayments
  class Create
    include Interactor

    def call
      context.billet_payment = BilletPayment.create!(context.billet_payments_params)
    end
  end
end
