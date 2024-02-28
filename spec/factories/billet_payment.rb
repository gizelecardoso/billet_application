# frozen_string_literal: true

FactoryBot.define do
  factory :billet_payment do
    amount { 100 }
    expire_at { Time.now + 7 }
    status { 'opened' }
    customer
  end
end
