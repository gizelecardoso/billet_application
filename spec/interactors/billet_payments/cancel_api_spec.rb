# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::CancelApi, type: :interactor do
  describe '#call' do
    it 'returns data with success' do
      create(:customer, :with_addresses)
      billet_payment_json = {
        status: 'canceled'
      }

      expect(BoletoSimples::BankBillet)
        .to receive(:cancel)
        .and_return(BoletoSimples::BankBillet.new(billet_payment_json))

      response = described_class.call(billet_payment_json:)

      expect(response.billet_payment_json[:status]).to eq('canceled')
    end
  end
end
