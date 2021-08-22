require 'rails_helper'

RSpec.describe 'Targets', type: :request do
  let!(:user) { create(:user) }
  let!(:topic) { create(:topic) }
  let!(:targets) { create_list(:target, 3, user: user, topic_id: topic.id) }

  subject(:delete_target) { delete target_path(targets[0].id), headers: user_auth_headers, as: :json }

  describe 'DELETE /api/targets/:id' do
    context 'With correct params' do
      it 'returns a successful response' do
        delete_target
        expect(response).to be_successful
      end

      it 'check number of targets increases by 1' do
        expect { delete_target }.to change { Target.count }.by(-1)
      end
    end
  end
end
