require 'rails_helper'

RSpec.describe 'api/topics', type: :request do
  describe 'GET /index' do
    let!(:topic) { create(:topic) }

    before do
      get topics_url, headers: user_auth_headers, as: :json
    end

    it 'successful response' do
      expect(response).to be_successful
    end

    it 'check topic' do
      parsed = JSON.parse(response.body)
      expect(parsed[0]['name']).to eq(topic.name)
      expect(parsed[0]['image']).to eq(topic.image)
    end
  end
end
