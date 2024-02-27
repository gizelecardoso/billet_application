# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  describe 'model validations' do
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:neighborhood) }
  end

  describe 'model associations' do
    it { should belong_to(:customer) }
  end
end
