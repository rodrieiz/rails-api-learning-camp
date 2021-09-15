require 'rails_helper'

RSpec.describe 'GET /messages', type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:conversation) { create(:conversation, user1: user) }
  let!(:conversation_aux) { create(:conversation) }
  let!(:messages) { create_list(:message, 30, user: user, conversation: conversation) }

  subject(:list_messages) { get messages_url, params: params, headers: headers }

  context 'with valid parameters' do
    let(:headers) { user_auth_headers }
    let(:params) do
      {
        offset: 1,
        conversation_id: conversation.id
      }
    end

    it 'returns a successful response' do
      list_messages
      expect(response).to be_successful
    end

    it 'check items attrubutes in the response' do
      list_messages
      expect(json['messages'].size).to eq(25)
    end
  end

  context 'with invalid parameter conversation_id' do
    let(:headers) { user_auth_headers }
    let(:params) do
      {
        offset: 1,
        conversation_id: conversation_aux.id
      }
    end

    it 'returns a not found response' do
      list_messages
      expect(response).to be_not_found
    end

    it 'returns msg error' do
      list_messages
      expect(json['errors']).to include(I18n.t('validations.message_invalid_atributes'))
    end
  end

  context 'with no authenticated user' do
    let(:headers) {}
    let(:params) do
      {
        offset: 1,
        conversation_id: conversation.id
      }
    end

    it 'returns status unauthorized' do
      list_messages
      expect(response).to be_unauthorized
    end
  end
end
