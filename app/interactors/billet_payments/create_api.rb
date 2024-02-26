require_relative '../configure_api'

module BilletPayments
  class CreateApi
    include Interactor

    def call
      context.bank_billet = BoletoSimples::BankBillet.create(context.billet_payment_json)

      error = context.bank_billet.response_errors

      if error.present?
        context.fail!(message: error.first["title"]) if error.present?
      end
    end
  end
end
