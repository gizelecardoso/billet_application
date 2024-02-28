# frozen_string_literal: true

require_relative '../configure_api'

module BilletPayments
  # Class responsible for LIST all billet_payments by API
  class ListApi
    include Interactor

    def call
      billet_payments_api = BoletoSimples::BankBillet.all

      context.billet_payments = billet_payments_api.map(&:attributes)
    rescue BoletoSimples::ResponseError
      context.message = 'Ocorreu um erro ao acessar a API do Kobana. Tente mais tarde'
    end
  end
end
