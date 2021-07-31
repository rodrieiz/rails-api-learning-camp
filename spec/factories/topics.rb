FactoryBot.define do
  factory :topic do
    name { Faker::Alphanumeric.alpha }
    image { Faker::Alphanumeric.alpha }
  end
end
