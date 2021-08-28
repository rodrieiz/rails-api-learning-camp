# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  message         :string           not null
#  user_id         :bigint           not null
#  conversation_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :message do
    message { Faker::Lorem.sentence }
  end
end
