require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  let!(:user) { create(:user) }
  let!(:conversation) { create(:conversation, user1: user) }

  it 'successfully connect' do
    token = user.id
    connect "cable?token=#{token}"
    expect(connection.current_user).to eq(user)
  end
end
