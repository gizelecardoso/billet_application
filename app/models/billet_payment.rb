# frozen_string_literal: true

# Model responsible for customer billet payments infos
class BilletPayment < ApplicationRecord
  before_validation :set_default_values

  belongs_to :customer

  enum status: { opened: 0, overdue: 1, canceled: 2 }

  validates :amount, presence: true
  validates :status, presence: true
  validates :expire_at, presence: true

  def set_default_values
    self.status = 0
  end
end
