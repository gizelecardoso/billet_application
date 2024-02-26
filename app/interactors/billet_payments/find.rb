require_relative '../configure_api'

module BilletPayments
  class Find
    include Interactor

    def call
      context.billet_payment = BoletoSimples::BankBillet.find(id: context.billet_payment_id)
    end
  end
end
