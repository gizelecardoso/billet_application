# frozen_string_literal: true

module BilletPayments
  # Class responsible for generate a billet_payment data based on the model validations
  class GenerateData
    include Interactor

    delegate :billet_payment, to: :context

    def call
      context.billet_payment_data = {
        amount: billet_payment['amount'],
        expire_at: billet_payment['expire_at'],
        api_id: billet_payment['id'],
        status: billet_payment['status'],
        customer: context.customer
      }
    end
  end
end
