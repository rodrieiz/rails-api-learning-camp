require 'rails_helper'

RSpec.describe 'POST registration/password', type: :request do
  let(:user) { create(:user) }

  subject(:send_reset_instructions) { post user_password_path, params: params, as: :json }

  context 'with valid params' do
    let(:params) do
      {
        email: user.email,
        redirect_url: 'registration/password'
      }
    end

    it 'returns a successful response' do
      send_reset_instructions
      expect(response).to be_successful
    end

    it 'send an email' do
      expect { send_reset_instructions }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'check email account and subject' do
      send_reset_instructions
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to include(user.email)
      expect(email.subject).to eq('Reset password instructions')
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        email: 'testemail@railsapi.uy',
        redirect_url: 'registration/password'
      }
    end

    it 'returns a not found response' do
      send_reset_instructions
      expect(response).to be_not_found
    end

    it 'does not send an email' do
      expect { send_reset_instructions }.to_not change { ActionMailer::Base.deliveries.count }
    end
  end
end
