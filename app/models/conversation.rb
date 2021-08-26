class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User', foreign_key: 'user1'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2'

  validates_uniqueness_of :user1, scope: %i[user2]
end
