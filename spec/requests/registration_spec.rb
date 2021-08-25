require 'rails_helper'

describe 'POST registration', type: :request do
  subject(:registration) { post user_registration_path, params: params, as: :json }
  subject(:confirmation) { get user_confirmation_path, params: params, as: :json }

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

    it 'returns success' do
      registration
      expect(response).to be_successful
    end

    it 'returns the user' do
      registration
      expect(json['data']['gender']).to eq(params[:user][:gender])
      expect(json['data']['email']).to eq(params[:user][:email])
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

    it 'returns error code' do
      registration
      expect(response).to be_unprocessable
    end
  end
end
