# frozen_string_literal: true

module BilletPayments
  # Class responsible for CANCEL a billet_payment into the database
  class Cancel
    include Interactor

    def call
      context.find_payment = BilletPayment.find_by(api_id: context.billet_payment_id)

      context.find_payment.update!(status: 'canceled')
    end
  end
end
