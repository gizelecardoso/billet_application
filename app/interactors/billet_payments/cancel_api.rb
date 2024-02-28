# frozen_string_literal: true

require_relative '../configure_api'

module BilletPayments
  # Class responsible for CANCEL an billet_payment by API
  class CancelApi
    include Interactor

    delegate :billet_payment, to: :context

    def call
      billet_payment = BoletoSimples::BankBillet.cancel(id: context.billet_payment_id)
    end
  end
end
