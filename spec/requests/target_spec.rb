require 'rails_helper'

RSpec.describe 'Targets', type: :request do
  describe 'POST /api/targets' do
    context 'With correct params' do
      let!(:user) { create(:user) }
      let!(:topic) { create(:topic) }
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

      before { post targets_url, params: params, headers: user_auth_headers, as: :json }

      it 'successful response' do
        expect(response).to be_successful
      end

      it 'check target params in the response' do
        expect(json['title']).to eq(params[:target][:title])
        expect(json['radius'].to_f).to eq(params[:target][:radius])
        expect(json['latitude'].to_f).to eq(params[:target][:latitude])
        expect(json['longitude'].to_f).to eq(params[:target][:longitude])
      end

      it 'check target saved in db' do
        expect(Target.count).to eq(1)
        expect(Target.last.title).to eq(params[:target][:title])
        expect(Target.last.radius).to eq(params[:target][:radius])
        expect(Target.last.latitude).to eq(params[:target][:latitude])
        expect(Target.last.longitude).to eq(params[:target][:longitude])
      end
    end

    context 'With incorrect params' do
      let!(:user) { create(:user) }
      let(:params) do
        {
          target:
          {
            title: 'Airports',
            radius: 120,
            latitude: 80,
            longitude: 30
          }
        }
      end

      before { post targets_url, params: params, headers: user_auth_headers, as: :json }

      it 'bad response' do
        expect(response).to be_unprocessable
      end

      it 'check errors' do
        expect(json['errors']).to be_present
      end

      it 'check no targets in db' do
        expect(Target.count).to eq(0)
      end
    end
  end

  describe 'GET /api/targets' do
    context 'With valid user' do
      let!(:user) { create(:user) }
      let!(:topic) { create(:topic) }
      let!(:target) { create(:target, topic_id: topic.id, user: user) }

      before { get targets_url, headers: user_auth_headers, as: :json }

      it 'successful response' do
        expect(response).to be_successful
      end

      it 'check presence of created target' do
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
    let!(:user) { create(:user) }

    before { get targets_url, headers: {}, as: :json }

    it 'status unauthorized' do
      expect(response).to be_unauthorized
    end

    it 'error message' do
      expect(json['errors']).to eq(['You need to sign in or sign up before continuing.'])
    end
  end
end
