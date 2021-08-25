require 'rails_helper'

RSpec.describe 'GET registration/confirmation', type: :request do
  let!(:user) { create(:user, confirmed_at: nil) }
  subject(:confirmation) { get user_confirmation_path, params: params, as: :json }

  context 'with correct params' do
    let(:token) { User.find_by(email: user.email).confirmation_token }
    let(:params) do
      {
        config: 'default',
        confirmation_token: token,
        redirect_url: '/'
      }
    end

    it 'returns status success' do
      confirmation
      expect(response).to be_successful
    end
  end
end
