class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(message_params[:conversation_id])
    if @conversation && (current_user == @conversation.user1 || current_user == @conversation.user2)
      @message = @conversation.messages.create(message_params)
      @message.user = current_user
    else
      render json: { errors: I18n.t('validations.message_invalid_atributes') }, status: :not_found
    end
  end

  def index
    @conversation = Conversation.find(params[:conversation_id])
    if @conversation && (current_user == @conversation.user1 || current_user == @conversation.user2)
      @pagy, @messages = pagy(@conversation.messages, page: params[:offset])
    else
      render json: { errors: I18n.t('validations.message_invalid_atributes') }, status: :not_found
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :conversation_id)
  end
end
