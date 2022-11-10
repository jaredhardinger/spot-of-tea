FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.sentence }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    status { :active }
    frequency { Faker::Number.between(from: 1, to: 52) }
  end
end
