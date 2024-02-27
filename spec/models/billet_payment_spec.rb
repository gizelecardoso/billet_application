# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPayment do
  describe 'model validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:expire_at) }
  end

  describe 'model associations' do
    it { should belong_to(:customer) }
  end

  describe 'enum' do
    it 'returns status enum with values' do
      should define_enum_for(:status)
        .with_values(%i[opened overdue canceled paid])
    end
  end

  describe '#set_default_values' do
    it 'returns opened status default' do
      billet_payment = create(:billet_payment)

      expect(billet_payment.status).to eq('opened')
    end
  end
end
