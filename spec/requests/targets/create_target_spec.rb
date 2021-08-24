require 'rails_helper'

RSpec.describe 'POST /api/targets', type: :request do
  let!(:user) { create(:user) }
  let!(:topic) { create(:topic) }

  subject(:create_target) { post targets_url, params: params, headers: user_auth_headers, as: :json }

  context 'with correct params' do
    let(:params) do
      {
        target:
        {
          title: 'Cinema',
          radius: 200,
          topic_id: topic.id,
          latitude: 90,
          longitude: 90
        }
      }
    end

    it 'returns a successful response' do
      create_target
      expect(response).to be_successful
    end

    it 'check target params in the response' do
      create_target
      expect(json['title']).to eq(params[:target][:title])
      expect(json['radius'].to_f).to eq(params[:target][:radius])
      expect(json['latitude'].to_f).to eq(params[:target][:latitude])
      expect(json['longitude'].to_f).to eq(params[:target][:longitude])
    end

    it 'creates a new target' do
      expect { create_target }.to change { Target.count }.by(1)
    end

    it 'check target saved in db' do
      create_target
      saved_target = Target.last
      expect(saved_target.title).to eq(params[:target][:title])
      expect(saved_target.radius).to eq(params[:target][:radius])
      expect(saved_target.latitude).to eq(params[:target][:latitude])
      expect(saved_target.longitude).to eq(params[:target][:longitude])
    end
  end

  context 'with incorrect params' do
    let(:params) do
      {
        target:
        {
          title: 'Cinema',
          radius: 200,
          latitude: 90,
          longitude: 90
        }
      }
    end

    it 'returns a bad response' do
      create_target
      expect(response).to be_unprocessable
    end

    it 'check errors' do
      create_target
      expect(json['errors']).to be_present
    end

    it 'does not create a target' do
      expect { create_target }.not_to change { Target.count }
    end
  end
end
