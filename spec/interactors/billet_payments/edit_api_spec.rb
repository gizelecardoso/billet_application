# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::EditApi, type: :interactor do
  describe '#call' do
    it 'returns success' do
      billet_payment_json = {
        expire_at: (Date.today + 7).strftime('%F')
      }

      expect(BilletPayments::EditApi).to receive(:call).with(billet_payment_id: 1, billet_payment_json:).and_return(204)
      response = described_class.call(billet_payment_id: 1, billet_payment_json:)

      expect(response).to eq(204)
    end
  end
end
