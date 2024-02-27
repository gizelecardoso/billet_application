# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::Create, type: :interactor do
  describe '#call' do
    context 'when params are valids' do
      it 'returns success' do
        customers_params = {
          name: 'Gizele Santos',
          document: '405.051.120-78'
        }

        expect(described_class.call(customers_params:)).to be_a_success
      end

      it 'creates new customer' do
        customers_params = {
          name: 'Gizele Santos',
          document: '405.051.120-78'
        }

        expect { described_class.call(customers_params:) }.to change(Customer, :count).by(1)
      end
    end

    context 'when params are invalid' do
      it 'returns failure' do
        customers_params = {}

        result = described_class.call(customers_params:)

        expect(result.failure?).to be true
      end

      it 'doesnt creates new customer' do
        customers_params = {}

        expect { described_class.call(customers_params:) }.to_not change(Customer, :count)
      end
    end
  end
end
