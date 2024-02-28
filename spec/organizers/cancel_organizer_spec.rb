# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayments::CancelOrganizer, type: :organizer do
  describe '#call' do
    it 'returns sequency of interactors' do
      expect(described_class.organized).to eq(
        [
          BilletPayments::CancelApi,
          BilletPayments::FindApi,
          BilletPayments::Cancel
        ]
      )
    end
  end
end
