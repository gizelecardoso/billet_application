# frozen_string_literal: true

require_relative '../configure_api'

module BilletPayments
  # Class responsible for CANCEL an billet_payment by API
  class CancelApi
    include Interactor

    delegate :billet_payment, to: :context

    def call
      billet_payment = BoletoSimples::BankBillet.cancel(id: context.billet_payment_id)

      error = billet_payment.response_errors

      return unless error.present?

      context.fail!(message: error.first['title']) if error.present?
    end
  end
end
