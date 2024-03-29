# frozen_string_literal: true

module BilletPayments
  # Class responsible for EDIT a billet_payment into the database
  class Edit
    include Interactor

    def call
      context.find_payment = BilletPayment.find_by(api_id: context.billet_payment_id)

      context.find_payment.update!(context.billet_payment_data)
    end
  end
end
