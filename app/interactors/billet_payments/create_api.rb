# frozen_string_literal: true

require_relative '../configure_api'

module BilletPayments
  # Class responsible for CREATE an billet_payment by API
  class CreateApi
    include Interactor

    delegate :bank_billet, to: :context

    def call
      bank_billet = BoletoSimples::BankBillet.create(context.billet_payment_json)
      context.billet_payment_id = bank_billet['id']

      error = bank_billet.response_errors

      return unless error.present?

      context.fail!(message: error) if error.present?
    end
  end
end
