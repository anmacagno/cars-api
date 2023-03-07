# frozen_string_literal: true

FactoryBot.define do
  factory :model do
    association :brand, name: 'Chevrolet'
    name { 'Camaro' }
    average_price { 507_271 }
  end
end
