# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::Create, type: :interactor do
  describe '#call' do
    context 'when params are valids' do
      it 'returns success' do
        billet_payment_data = {
          amount: 100,
          expire_at: Time.now,
          customer: create(:customer)
        }

        expect(described_class.call(billet_payment_data:)).to be_a_success
      end

      it 'creates new billet_payment' do
        billet_payment_data = {
          amount: 100,
          expire_at: Time.now,
          customer: create(:customer)
        }

        expect { described_class.call(billet_payment_data:) }.to change(BilletPayment, :count).by(1)
      end
    end

    context 'when params are invalid' do
      it 'returns failure' do
        billet_payment_data = {}

        result = described_class.call(billet_payment_data:)

        expect(result.failure?).to be true
      end

      it 'doesnt creates new address' do
        billet_payment_data = {}

        expect { described_class.call(billet_payment_data:) }.to_not change(BilletPayment, :count)
      end
    end
  end
end
