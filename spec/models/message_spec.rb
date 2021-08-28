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
require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { build(:message) }
  it { is_expected.to validate_presence_of(:message) }
  it { should belong_to(:user) }
  it { should belong_to(:conversation) }
end
