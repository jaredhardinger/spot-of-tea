FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Hipster.sentence }
    temperature { Faker::Number.between(from: 150, to: 212) }
    brew_time { Faker::Number.between(from: 30, to: 600) }
  end
end
