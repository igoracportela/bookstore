FactoryBot.define do
  factory :review do
    title { "MyString" }
    description { "MyString" }
    score { 1 }
    books { nil }
  end
end
