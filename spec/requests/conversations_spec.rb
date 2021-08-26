require 'rails_helper'

RSpec.describe 'GET conversation/index', type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:topic) { create(:topic) }
  # let!(:target1) { create(:target, topic_id: topic.id, user: user, latitude: 90, longitude: 90) }
  let!(:target2) { create(:target, topic_id: topic.id, user: user2, latitude: 90, longitude: 90) }
  let!(:target3) { create(:target, topic_id: topic.id, user: user2, latitude: 5, longitude: 5) }

  subject(:create_target) { post targets_url, params: params, headers: user_auth_headers, as: :json }
  subject(:conversations) { get conversations_url, headers: headers, as: :json }

  context 'with valid user' do
    let(:headers) { user_auth_headers }
    let(:params) do
      {
        target:
        {
          title: 'Cinema',
          radius: 2000,
          topic_id: topic.id,
          latitude: 5,
          longitude: 5
        }
      }
    end

    it 'returns a successful response' do
      create_target
      conversations
      expect(response).to be_successful
    end

    it 'returns a successful response' do
      create_target
      conversations
      expect(json[0]['user1']).to be_present
      expect(json[0]['user2']).to be_present
    end
  end
end
