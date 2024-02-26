require_relative '../configure_api'

module BilletPayments
  class EditApi
    include Interactor
    include HTTParty
    base_uri 'https://api-sandbox.kobana.com.br/v1'

    def call
      self.class.headers 'Authorization' =>  "Bearer #{ENV.fetch('KOBANA_TOKEN')}"

      response = self.class.put("/bank_billets/#{context.billet_payments_params[:id]}", body: context.billet_payment_json)
    end
  end
end
