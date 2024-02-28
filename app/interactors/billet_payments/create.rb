# frozen_string_literal: true

module BilletPayments
  # Class responsible for CREATE a billet_payment into the database
  class Create
    include Interactor

    def call
      billet_payment = BilletPayment.new(context.billet_payment_data)

      context.fail!(error: :invalid_record) unless billet_payment.save
    end
  end
end
