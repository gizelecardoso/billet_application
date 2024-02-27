# frozen_string_literal: true

require_relative '../configure_api'

module BilletPayments
  # Class responsible for EDIT an billet_payment by API
  class EditApi
    include Interactor
    include HTTParty
    base_uri 'https://api-sandbox.kobana.com.br/v1'

    def call
      self.class.headers 'Authorization' => "Bearer #{ENV.fetch('KOBANA_TOKEN')}"

      self.class.put("/bank_billets/#{context.billet_payment_id}",
                     body: { bank_billet: context.billet_payment_json })
    end
  end
end
