# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::Find, type: :interactor do
  describe '#call' do
    context 'when exist customer with param id' do
      it 'returns success' do
        customer = create(:customer)
        params = { name: 'Gizele', customer_id: customer.id }
        result = described_class.call(billet_payments_params: params)

        expect(result.success?).to be true
      end

      it 'returns found customer' do
        customer = create(:customer)
        params = { name: 'Gizele', customer_id: customer.id }
        result = described_class.call(billet_payments_params: params)

        expect(result.customer).to eq(customer)
      end
    end

    context 'when doenst exist customer with param id' do
      it 'returns nil' do
        params = { name: '', customer_id: 'not-found-id' }
        result = described_class.call(billet_payments_params: params)

        expect(result.customer).to be(nil)
      end
    end
  end
end
