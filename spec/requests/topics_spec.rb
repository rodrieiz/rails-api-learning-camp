require 'rails_helper'

RSpec.describe 'api/topics', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get topics_url, as: :json
      expect(response).to be_successful
    end
  end
end
