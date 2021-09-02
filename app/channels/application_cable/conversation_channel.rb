class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    Conversation.where(user1: current_user0).or(Conversation.where(user2: current_user)).find_each do |conversation|
      stream_from "conversations_#{conversation.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def receive(data)
    @conversation = Conversation.find(data.fetch('conversation_id'))
    if(@conversation.user1.id == current_user.id) || (@conversation.user2.id == current_user.id)
      msg = @conversation.messages.build(user_id: current_user.id)
      msg.message = data['message'].present? ? data.fetch('message') : nil
      if msg.save
        MessageRelayJob.perform_later(msg)
      end
    end
  end
end
