# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::Edit, type: :interactor do
  describe '#call' do
    context 'when params are valids' do
      it 'returns success' do
        create(:billet_payment, api_id: 10)
        billet_payment_data = {
          amount: 100,
          expire_at: Time.now,
          customer: create(:customer)
        }

        result = described_class.call(billet_payment_id: 10, billet_payment_data:)

        expect(result).to be_a_success
      end

      it 'edits new billet_payment' do
        create(:billet_payment, amount: 10, api_id: 10)
        billet_payment_data = {
          amount: 100,
          expire_at: Time.now,
          customer: create(:customer)
        }

        result = described_class.call(billet_payment_id: 10, billet_payment_data:)

        expect(result.find_payment.amount).to eq(100)
      end
    end
  end
end
