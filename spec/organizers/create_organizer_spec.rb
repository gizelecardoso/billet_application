# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::CreateOrganizer, type: :organizer do
  describe '#call' do
    it 'returns sequency of interactors' do
      expect(described_class.organized).to eq(
        [
          Customers::Find,
          BilletPayments::GenerateJsonToApi,
          BilletPayments::CreateApi,
          BilletPayments::FindApi,
          BilletPayments::GenerateData,
          BilletPayments::Create
        ]
      )
    end
  end
end
