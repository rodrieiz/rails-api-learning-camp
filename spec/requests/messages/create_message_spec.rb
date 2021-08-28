require 'rails_helper'

RSpec.describe 'POST /meesages', type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:conversation) { create(:conversation, user1: user) }
  let(:conversation_aux) { create(:conversation) }

  subject(:create_message) { post messages_url, params: params, headers: headers }

  context 'with valid parameters' do
    let(:headers) { user_auth_headers }
    let(:params) do
      {
        message:
        {
          message: 'Shall we go to the cinema?',
          conversation_id: conversation.id
        }
      }
    end

    it 'returns a successful response' do
      create_message
      expect(response).to be_successful
    end

    it 'check items attrubutes in the response' do
      create_message
      expect(json['message']).to be_present
    end
  end

  context 'with invalid parameter conversation_id' do
    let(:headers) { user_auth_headers }
    let(:params) do
      {
        message:
        {
          message: 'The weather is bad',
          conversation_id: conversation_aux.id
        }
      }
    end
    it 'returns a not found response' do
      create_message
      expect(response).to be_not_found
    end

    it 'returns msg error' do
      create_message
      expect(json['errors']).to include(I18n.t('validations.message_invalid_atributes'))
    end
  end

  context 'with no authenticated user' do
    let(:headers) {}
    let(:params) do
      {
        message:
        {
          message: 'Where is the dog?',
          conversation_id: conversation_aux.id
        }
      }
    end

    it 'returns status unauthorized' do
      create_message
      expect(response).to be_unauthorized
    end
  end
end
