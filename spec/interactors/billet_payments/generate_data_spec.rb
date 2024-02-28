# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::GenerateData, type: :interactor do
  describe '#call' do
    it 'returns success' do
      customer_id = { customer_id: 1 }
      billet_payment = {
        'amount' => 100,
        'expire_at' => '2024-05-03',
        'id' => 10,
        'customer_id' => 1,
        'status' => 'opened'
      }

      result = described_class.call(billet_payment:, billet_payments_params: customer_id)

      expect(result).to be_a_success
    end

    it 'returns data' do
      customer_id = { 'customer_id' => 1 }
      billet_payment = {
        'amount' => 100,
        'expire_at' => '2024-05-03',
        'id' => 10,
        'customer_id' => 1,
        'status' => 'opened'
      }
      result = described_class.call(billet_payment:, billet_payments_params: customer_id)

      billet_payment['api_id'] = billet_payment.delete 'id'
      billet_payment.transform_keys(&:to_sym)

      expect(result.billet_payment_data).to eq(billet_payment.transform_keys(&:to_sym))
    end
  end
end
