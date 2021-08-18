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
end
