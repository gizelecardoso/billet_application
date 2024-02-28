# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::CreateApi, type: :interactor do
  describe '#call' do
    context 'when params are valids' do
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

        expect(BoletoSimples::BankBillet)
          .to receive(:create)
          .and_return(BoletoSimples::BankBillet.new(billet_payment_json))

        response = described_class.call(billet_payment_json:)

        expect(response.billet_payment_json).to eq(billet_payment_json)
      end
    end

    context 'when param is invalid - amount' do
      it 'returns message error' do
        customer = create(:customer, :with_addresses)
        billet_payment_json = {
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

        returned_message = BoletoSimples::BankBillet.new(billet_payment_json)
        returned_message.response_errors = { amount: ['não pode ficar em branco'] }

        expect(BoletoSimples::BankBillet).to receive(:create).and_return(returned_message)

        response = described_class.call(billet_payment_json:)

        expect(response.message).to eq(returned_message.response_errors)
      end
    end
  end
end
