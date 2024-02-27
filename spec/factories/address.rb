# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address { 'Rua Brasil' }
    city { 'São Paulo' }
    state { 'SP' }
    zipcode { '04365980' }
    neighborhood { 'Vila Jabaquara' }
    customer
  end
end
