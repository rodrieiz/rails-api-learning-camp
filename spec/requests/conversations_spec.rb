require 'rails_helper'

RSpec.describe 'GET conversation/index', type: :request do
  let!(:user) { create(:user) }
  let!(:conversation) { create_list(:conversation, 3, user1: user) }

  subject(:conversations) { get conversations_url, headers: headers, as: :json }

  context 'with valid user' do
    let(:headers) { user_auth_headers }

    it 'returns a successful response' do
      conversations
      expect(response).to be_successful
    end

    it 'check items attrubutes in the response' do
      conversations
      expect(json[0]['user1']).to be_present
      expect(json[0]['user2']).to be_present
    end
  end

  context 'with no authenticated user' do
    let(:headers) {}

    it 'returns status unauthorized' do
      conversations
      expect(response).to be_unauthorized
    end
  end
end
