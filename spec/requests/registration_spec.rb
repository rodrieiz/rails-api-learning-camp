require 'rails_helper'

describe 'POST registration', type: :request do
  context 'with correct params' do
    let(:params) do
      {
        user:
        {
          email: 'test1@test.com.uy',
          gender: 'Female',
          password: 'abcd1234',
          password_confirmation: 'abcd1234'
        },
        confirm_success_url: '/'
      }
    end

    before { post user_registration_path, params: params, as: :json }

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'returns the user' do
      json = JSON.parse(response.body).with_indifferent_access
      expect(json[:data][:gender]).to eq(params[:user][:gender])
      expect(json[:data][:email]).to eq(params[:user][:email])
    end
  end

  context 'with incorrect params, missing email' do
    let(:params) do
      {
        user:
        {
          gender: 'Female',
          password: 'abcd1234',
          password_confirmation: 'abcd1234'
        }
      }
    end

    before { post user_registration_path, params: params, as: :json }

    it 'returns error code' do
      expect(response).to have_http_status(422)
    end
  end
end
