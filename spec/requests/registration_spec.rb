require 'rails_helper'

describe 'POST registration', type: :request do
    
  let(:params) do {
    user:
      {
        email: 'test1@test.com.uy',
        gender: 'Female',
        password: 'abcd1234',
        password_confirmation: 'abcd1234'
      }
    }
  end

  context 'with correct params' do

    before {post user_registration_path, params: params, as: :json}

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'returns the user' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json[:data][:gender]).to eq(params[:user][:gender])
      expect(json[:data][:email]).to eq(params[:user][:email])
    end
  end
end
