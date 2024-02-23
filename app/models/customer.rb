class Customer < ApplicationRecord
  validates :name, presence: true
  validates :document, presence: true
end
