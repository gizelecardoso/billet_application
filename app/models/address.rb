class Address < ApplicationRecord
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :neighborhood, presence: true
end
