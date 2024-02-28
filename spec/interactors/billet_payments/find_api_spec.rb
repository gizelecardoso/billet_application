# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::FindApi, type: :interactor do
  describe '#call' do
    it 'returns data with success' do
      customer = create(:customer, :with_addresses)
      billet_payment_json = {
        amount: 100,
        expire_at: (Date.today + 7).strftime('%F'),
        status: 'opened',
        customer_person_name: customer.name,
        customer_cnpj_cpf: customer.document,
        customer_state: customer.addresses.last.state,
        customer_address: customer.addresses.last.address,
        customer_city_name: customer.addresses.last.city,
        customer_zipcode: customer.addresses.last.zipcode,
        customer_neighborhood: customer.addresses.last.neighborhood
      }

      bank_billet = BoletoSimples::BankBillet.new(billet_payment_json)
      expect(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)

      response = described_class.call(billet_payment_json:)

      expect(response.billet_payment).to eq(bank_billet)
    end
  end
end
