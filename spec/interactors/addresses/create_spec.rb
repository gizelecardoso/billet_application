# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Addresses::Create, type: :interactor do
  describe '#call' do
    context 'when params are valids' do
      it 'returns success' do
        address_params = {
          address: 'Rua Brasil',
          city: 'São Paulo',
          state: 'SP',
          zipcode: '04365980',
          neighborhood: 'Vila Jabaquara',
          customer: create(:customer)
        }

        expect(described_class.call(address_params:)).to be_a_success
      end

      it 'creates new address' do
        address_params = {
          address: 'Rua Brasil',
          city: 'São Paulo',
          state: 'SP',
          zipcode: '04365980',
          neighborhood: 'Vila Jabaquara',
          customer: create(:customer)
        }

        expect { described_class.call(address_params:) }.to change(Address, :count).by(1)
      end
    end

    context 'when params are invalid' do
      it 'returns failure' do
        address_params = {}

        result = described_class.call(address_params:)

        expect(result.failure?).to be true
      end

      it 'doesnt creates new address' do
        address_params = {}

        expect { described_class.call(address_params:) }.to_not change(Address, :count)
      end
    end
  end
end
