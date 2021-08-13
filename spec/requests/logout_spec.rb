require 'rails_helper'

RSpec.describe 'registraton/sign_out', type: :request do
  describe 'POST /registration/sign_out' do
    context 'user with valid session' do
      let(:user) { create(:user) }
      let(:params) do
        {
          email: user.email,
          password: user.password
        }
      end

      before { delete destroy_user_session_path, headers: user_auth_headers, as: :json }

      it 'status ok' do
        expect(response).to be_successful
      end
    end

    context 'not authenticated user' do
      let(:user) { create(:user) }
      let(:headers) {}
      before { delete destroy_user_session_path, headers: headers, as: :json }

      it 'status bad' do
        expect(response).to be_not_found
      end

      it 'invalid session or user' do
        expect(json['errors']).to eq(['User was not found or was not logged in.'])
      end
    end
  end
end
