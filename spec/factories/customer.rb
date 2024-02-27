# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'Gizele Correia Cardoso dos Santos' }
    document { '39058072037' }
  end

  trait :with_addresses do
    after(:create) do |customer|
      create_list(:address, 2, customer)
    end
  end

  trait :with_billet_payments do
    after(:create) do |customer|
      create_list(:billet_payment, 2, customer)
    end
  end
end
