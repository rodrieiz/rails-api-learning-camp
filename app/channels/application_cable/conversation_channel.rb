module ApplicationCable
  class ConversationChannel < ActionCable::Channel::Base
    def subscribed
      stop_all_streams
      Conversation.where(user1: current_user).or(Conversation.where(user2: current_user)).find_each do |conversation|
        stream_for "conversations_#{conversation.id}"
      end
    end

    def unsubscribed
      stop_all_streams
    end

    def receive (data)
      @conversation = Conversation.find(data.fetch('conversation_id'))
      if (@conversation.user1.id == current_user.id) || (@conversation.user2.id == current_user.id)
        msg = Message.create(
          conversation_id: @conversation.id,
          user_id: current_user.id,
          message: data['message'].present? ? data.fetch('message') : nil
        )
        perform(msg)
      end
    end

    def perform(message)
      data = {}
      data['id'] = message.id
      data['conversation_id'] = message.conversation_id
      data['message'] = message.message
      data['user_id'] = message.user_id
      data['created_at'] = message.created_at
      data['updated_at'] = message.updated_at
      ActionCable.server.broadcast "conversations_#{message.conversation_id}", data.as_json
    end
  end
end
