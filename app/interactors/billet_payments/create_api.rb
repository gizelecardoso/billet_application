require_relative '../configure_api'

module BilletPayments
  class CreateApi
    include Interactor

    def call
      @bank_billet = BoletoSimples::BankBillet.create(context.billet_payment_json)

      error = @bank_billet.response_errors

      if error.present?
        roolback_billet_created
        context.fail!(message: error.first["title"]) if error.present?
      end
    end

    private

    def roolback_billet_created
      BilletPayment.last.destroy
    end
  end
end
