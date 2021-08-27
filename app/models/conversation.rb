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
class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User', foreign_key: 'user1'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2'

  validates_uniqueness_of :user1, scope: %i[user2]
end
