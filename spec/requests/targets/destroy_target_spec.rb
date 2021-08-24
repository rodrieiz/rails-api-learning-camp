require 'rails_helper'

RSpec.describe 'DELETE /api/targets/:id', type: :request do
  let!(:user) { create(:user) }
  let!(:topic) { create(:topic) }
  let!(:targets) { create_list(:target, 3, user: user, topic_id: topic.id) }

  subject(:delete_target) { delete target_path(target_id), headers: headers, as: :json }

  context 'with correct params' do
    let(:headers) { user_auth_headers }
    let(:target_id) { targets[0].id }

    it 'returns a successful response' do
      delete_target
      expect(response).to be_successful
    end

    it 'decreases target count by 1' do
      expect { delete_target }.to change { Target.count }.by(-1)
    end
  end

  context 'target not found' do
    let(:headers) { user_auth_headers }
    let(:target_id) { 0 }

    it 'returns status not found' do
      delete_target
      expect(response).to be_not_found
    end
  end

  context 'not authenticated user' do
    let(:headers) {}
    let(:target_id) { targets[0].id }

    it 'status unauthorized' do
      delete_target
      expect(response).to be_unauthorized
    end
  end

end
