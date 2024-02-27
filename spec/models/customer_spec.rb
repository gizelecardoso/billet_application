# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer do
  describe 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:document) }
  end

  describe 'model associations' do
    it { should have_many(:addresses).dependent(:destroy) }
    it { should have_many(:billet_payments).dependent(:destroy) }
  end
end
