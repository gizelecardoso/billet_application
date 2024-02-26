module BilletPayments
  class Edit
    include Interactor

    def call
      find_payment = BilletPayment.find_by(api_id: context.billet_payments_params[:id])
      find_payment.update!(context.billet_payments_params)
    end
  end
end
