require 'rails_helper'

RSpec.describe 'api/topics', type: :request do
  describe 'GET /index' do
    let!(:topic1) { build(:topic, name: 'Food', image: 'food.jpg') }
    let!(:topic2) { build(:topic, name: 'Cars', image: 'cars.jpg') }

    it 'renders a successful response' do
      get topics_url, as: :json
      expect(response).to be_successful
    end

    it 'expeted 2 items' do
      get topics_url, as: :json
      pry
      expect(response.body.length).to eq(2)
    end
  end
end
