# frozen_string_literal: true

# Model responsible for customer data
class Customer < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :billet_payments, dependent: :destroy

  validates :name, presence: true
  validates :document, presence: true
end
