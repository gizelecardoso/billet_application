# frozen_string_literal: true

# Model responsible for customer billet payments infos
class BilletPayment < ApplicationRecord
  belongs_to :customer

  validates :amount, presence: true
  validates :expire_at, presence: true

  validates :status, inclusion: { in: %w[opened overdue canceled paid],
                                  message: '%<value>s is not a valid status' }
end
