# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  user1      :integer          not null
#  user2      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :conversation do
    user1 { create(:user) }
    user2 { create(:user) }
  end
end
