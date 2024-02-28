# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::GenerateData, type: :interactor do
  describe '#call' do
    it 'returns success' do
      customer = create(:customer)
      billet_payment = {
        'amount' => 100,
        'expire_at' => '2024-05-03',
        'id' => 10,
        'status' => 'opened',
        'customer' => customer
      }

      result = described_class.call(billet_payment:, customer:)

      expect(result).to be_a_success
    end

    it 'returns data' do
      customer = create(:customer)
      billet_payment = {
        'amount' => 100,
        'expire_at' => '2024-05-03',
        'id' => 10,
        'status' => 'opened',
        'customer' => customer
      }
      result = described_class.call(billet_payment:, customer:)

      billet_payment['api_id'] = billet_payment.delete 'id'

      expect(result.billet_payment_data).to eq(billet_payment.transform_keys(&:to_sym))
    end
  end
end
