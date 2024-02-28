# frozen_string_literal: true

require_relative '../configure_api'

module BilletPayments
  # Class responsible for FIND an billet_payment by API
  class FindApi
    include Interactor

    def call
      context.billet_payment = BoletoSimples::BankBillet.find(id: context.billet_payment_id)
    end
  end
end
