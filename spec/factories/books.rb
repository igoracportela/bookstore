FactoryBot.define do
  factory :book do
    title { FFaker::Lorem.phrase }
    stock { FFaker::Number.number(digits: 2) }
  end
end
