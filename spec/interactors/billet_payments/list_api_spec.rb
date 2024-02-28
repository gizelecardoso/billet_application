# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::ListApi, type: :interactor do
  describe '#call' do
    it 'returns first data of a list with success' do
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
      }.transform_keys(&:to_s)

      returned_data = BoletoSimples::BankBillet.new(billet_payment_json)

      expect(BoletoSimples::BankBillet).to receive(:all).and_return([returned_data])
      response = described_class.call

      expect(response.billet_payments.first).to eq(billet_payment_json)
    end
  end
end
