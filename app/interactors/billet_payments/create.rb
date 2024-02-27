# frozen_string_literal: true

module BilletPayments
  # Class responsible for CREATE a billet_payment into the database
  class Create
    include Interactor

    def call
      BilletPayment.create!(context.billet_payment_data)
    end
  end
end
