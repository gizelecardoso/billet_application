# frozen_string_literal: true

# Model responsible for customer data
class Customer < ApplicationRecord
  validates :name, presence: true
  validates :document, presence: true
end
