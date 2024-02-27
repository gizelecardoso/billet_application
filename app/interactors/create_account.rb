# frozen_string_literal: true

require 'uri'
require 'net/http'

# Class responsible for create an account into the API, its important to create a billet_payment
class CreateAccount
  include Interactor

  def call
    URI('https://api-sandbox.kobana.com.br/v1/bank_billet_accounts')

    json =
      {
        bank_contract_slug: 'bb-bs-18-19-7',
        next_our_number: 1,
        agency_number: '4042',
        agency_digit: '8',
        account_number: '00008873',
        account_digit: '0',
        extra1: '0229385',
        extra3: '0229385',
        beneficiary_name: 'Kobana Instituição de Pagamento Ltda.',
        beneficiary_cnpj_cpf: '05.813.794/0001-26',
        beneficiary_address: 'Av. Presidente Vargas, 633, sala 1716, Centro, Rio de Janeiro, RJ, 20071004',
        name: 'Banco do Brasil 18-19  CC: 00008873-0 0229385',
        status: 'pending',
        bank_contract: {
          bank: {
            code: 'bb',
            name: 'Banco do Brasil',
            number: '001'
          },
          slug: 'bb-bs-18-19-7',
          code: '18',
          sufix: 'bs-18-19-7',
          variation: '19',
          name: '18-19 (Convênio com 7 dígitos)'
        },
        integration: false,
        created_via_api: true,
        next_remittance_number: 1,
        default: false,
        custom_name: 'Bancoob/Sicoob 01  CC: 00003666-8 0229385',
        kind: 'cnab400',
        beneficiary_address_street: 'Av. Presidente Vargas',
        beneficiary_address_street_number: '633',
        beneficiary_address_complement: 'sala 1716',
        beneficiary_address_city: 'Rio de Janeiro',
        beneficiary_address_neighborhood: 'Centro',
        beneficiary_address_state: 'RJ',
        beneficiary_address_zipcode: '20071004',
        allow_expiration_on_weekends: false
      }.to_json

    Net::HTTP.post URI('https://api-sandbox.kobana.com.br/v1/bank_billet_accounts'),
                   json,
                   'Content-Type' => 'application/json',
                   'Authorization' => "Bearer #{ENV.fetch('KOBANA_TOKEN')}"
  end
end
