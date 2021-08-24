# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  topic_id   :bigint           not null
#  title      :string
#  radius     :decimal(, )
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :target do
    title { Faker::Alphanumeric.alpha }
    radius { Faker::Number.number(digits: 3) }
    latitude { Faker::Number.decimal(l_digits: 3) }
    longitude { Faker::Number.decimal(l_digits: 3) }
  end
end
