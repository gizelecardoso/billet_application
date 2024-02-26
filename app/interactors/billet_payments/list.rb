require_relative '../configure_api'

module BilletPayments
  class List
    include Interactor

    def call
      billet_payments_api = BoletoSimples::BankBillet.all

      context.billet_payments = billet_payments_api.map(&:attributes)
    end
  end
end
