# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::Cancel, type: :interactor do
  describe '#call' do
    context 'when params are valids' do
      it 'returns success' do
        create(:billet_payment, api_id: 10)
        result = described_class.call(billet_payment_id: 10)

        expect(result).to be_a_success
      end

      xit 'cancel new billet_payment' do
        create(:billet_payment, api_id: 10)
        result = described_class.call(billet_payment_id: 10)

        expect(result.find_payment.status).to eq('canceled')
      end
    end
  end
end
