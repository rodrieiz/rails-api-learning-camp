require 'rails_helper'

RSpec.describe 'registraton', type: :request do
  describe 'POST /registration/sign_in' do
    context 'Invalid credentials' do
      let(:user) { create(:user) }
      let(:params) do
        {
          email: user.email,
          password: ''
        }
      end

      before { post new_user_session_path, params: params, as: :json }

      it 'error status unathorized' do
        expect(response).to be_unauthorized
      end

      it 'invalid credentials' do
        parsed = JSON.parse(response.body)
        expect(parsed['errors']).to eq(['Invalid login credentials. Please try again.'])
      end
    end
  end

  context 'Valid credentials' do
    let(:user) { create(:user) }
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end

    before { post new_user_session_path, params: params, as: :json }

    it 'ok status' do
      expect(response).to be_successful
    end

    it 'Check authorization headers' do
      headers = response.headers
      expect(headers['client']).to be_present
      expect(headers['uid']).to be_present
      expect(headers['expiry']).to be_present
      expect(headers['token-type']).to be_present
      expect(headers['access-token']).to be_present
    end
  end
end
