FactoryBot.define do
  factory :target do
    title { Faker::Alphanumeric.alpha }
    radius { Faker::Number.number(digits: 3) }
    latitude { Faker::Number.decimal(l_digits: 3) }
    longitude { Faker::Number.decimal(l_digits: 3) }
  end
end
