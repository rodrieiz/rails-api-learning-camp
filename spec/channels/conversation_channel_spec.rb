require 'rails_helper'

RSpec.describe ApplicationCable::ConversationChannel, type: :channel do
  let!(:user) { create(:user) }
  let!(:conversation) { create(:conversation, user1: user) }

  it 'successfully subscribe' do
    stub_connection current_user: user
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription.current_user).to eq(user)
  end

  it 'successfully send a message' do
    stub_connection current_user: user
    subscribe
    last_count = Message.count
    perform :receive, { message: 'Formula 1 is the best topic', conversation_id: conversation.id }
    expect(Message.count).to eql last_count + 1
  end
end
