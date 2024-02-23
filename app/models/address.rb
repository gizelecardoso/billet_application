# frozen_string_literal: true

# Model responsible for customer address data
class Address < ApplicationRecord
  belongs_to :customer

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :neighborhood, presence: true
end
