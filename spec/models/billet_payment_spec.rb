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
end
