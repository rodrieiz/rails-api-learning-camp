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

      it 'check target' do
        expect(json['title']).to eq(params[:target][:title])
        expect(json['radius'].to_f).to eq(params[:target][:radius])
        expect(json['latitude'].to_f).to eq(params[:target][:latitude])
        expect(json['longitude'].to_f).to eq(params[:target][:longitude])
      end
    end
  end
end
