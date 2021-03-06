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
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :message, presence: true
end
