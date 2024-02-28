# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::EditOrganizer, type: :organizer do
  describe '#call' do
    it 'returns sequency of interactors' do
      expect(described_class.organized).to eq(
        [
          BilletPayments::GenerateJsonToApi,
          BilletPayments::EditApi,
          BilletPayments::FindApi,
          BilletPayments::GenerateDataUpdate,
          BilletPayments::Edit
        ]
      )
    end
  end
end
