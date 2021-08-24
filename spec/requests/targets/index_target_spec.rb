require 'rails_helper'

RSpec.describe 'Targets', type: :request do
  let!(:user) { create(:user) }
  let!(:topic) { create(:topic) }
  let!(:target) { create(:target, topic_id: topic.id, user: user) }

  subject(:list_targets) { get targets_url, headers: headers, as: :json }

  describe 'GET /api/targets' do
    context 'With valid user' do
      let(:headers) { user_auth_headers }

      it 'returns a successful response' do
        list_targets
        expect(response).to be_successful
      end

      it 'check presence of created target' do
        list_targets
        expect(json[0]['title']).to eq(target.title)
        expect(json[0]['radius'].to_f).to eq(target.radius)
        expect(json[0]['latitude'].to_f).to eq(target.latitude)
        expect(json[0]['longitude'].to_f).to eq(target.longitude)
        expect(json[0]['topic']['name']).to eq(topic.name)
        expect(json[0]['topic']['image']).to eq(topic.image)
      end
    end
  end

  context 'not authenticated user' do
    let(:headers) {}

    it 'status unauthorized' do
      list_targets
      expect(response).to be_unauthorized
    end

    it 'error message' do
      list_targets
      expect(json['errors']).to eq(['You need to sign in or sign up before continuing.'])
    end
  end
end
