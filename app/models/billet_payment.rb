# frozen_string_literal: true

# Model responsible for customer billet payments infos
class BilletPayment < ApplicationRecord
  before_validation :set_expires_at

  enum status: { opened: 0, overdue: 1, canceled: 2 }

  validates :amount, presence: true
  validates :status, presence: true
  validates :expires_at, presence: true

  def set_expires_at
    self.expires_at = Date.today + 7
  end
end
