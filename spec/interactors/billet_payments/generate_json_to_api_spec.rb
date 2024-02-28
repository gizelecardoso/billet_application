# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::GenerateJsonToApi, type: :interactor do
  describe '#call' do
    context 'when passed an customer argument' do
      it 'returns success' do
        customer = create(:customer, :with_addresses)
        billet_payments_params = {
          amount: 100,
          id: 10,
          status: 'opened'
        }

        result = described_class.call(customer:, billet_payments_params:)

        expect(result).to be_a_success
      end

      it 'returns data' do
        customer = create(:customer, :with_addresses)
        billet_payments_params = {
          amount: 100,
          id: 10,
          status: 'opened'
        }

        returned_data = {
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

        result = described_class.call(customer:, billet_payments_params:)

        expect(result.billet_payment_json).to eq(returned_data)
      end
    end

    context 'when passes an billet_payment argument' do
      it 'returns success' do
        billet_payments_params = {
          amount: 100,
          id: 10,
          status: 'opened'
        }

        billet_payment = {
          'customer_person_name' => 'Gizele Correia',
          'customer_cnpj_cpf' => '819.574.470-28',
          'customer_state' => 'SP',
          'customer_address' => 'Rua Teste',
          'customer_city_name' => 'São Paulo',
          'customer_zipcode' => '04587-985',
          'customer_neighborhood' => 'Teste'
        }

        result = described_class.call(billet_payment:, billet_payments_params:)

        expect(result).to be_a_success
      end

      it 'returns data' do
        billet_payments_params = {
          amount: 100,
          id: 10,
          status: 'opened'
        }

        billet_payment = {
          'customer_person_name' => 'Gizele Correia',
          'customer_cnpj_cpf' => '819.574.470-28',
          'customer_state' => 'SP',
          'customer_address' => 'Rua Teste',
          'customer_city_name' => 'São Paulo',
          'customer_zipcode' => '04587-985',
          'customer_neighborhood' => 'Teste'
        }

        returned_data = {
          amount: 100,
          expire_at: (Date.today + 7).strftime('%F'),
          status: 'opened',
          customer_person_name: billet_payment['customer_person_name'],
          customer_cnpj_cpf: billet_payment['customer_cnpj_cpf'],
          customer_state: billet_payment['customer_state'],
          customer_address: billet_payment['customer_address'],
          customer_city_name: billet_payment['customer_city_name'],
          customer_zipcode: billet_payment['customer_zipcode'],
          customer_neighborhood: billet_payment['customer_neighborhood']
        }

        result = described_class.call(billet_payment:, billet_payments_params:)

        expect(result.billet_payment_json).to eq(returned_data)
      end
    end
  end
end
