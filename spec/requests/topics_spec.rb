require 'rails_helper'

RSpec.describe 'api/topics', type: :request do
  describe 'GET /index' do
    before do
      @topic = create(:topic)
      @user = build(:user)
      @auth_headers = @user.create_new_auth_token
      @auth_headers['uid'] = @user.email
      get topics_url, headers: @auth_headers, as: :json
    end

    it 'successful response' do
      expect(response).to be_successful
    end

    it 'check topic' do
      pry
      parsed = JSON.parse(response.body)
      expect(parsed[0]['name']).to eq(@topic.name)
      expect(parsed[0]['image']).to eq(@topic.image)
    end
  end
end
