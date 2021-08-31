class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.where(user1: current_user).or(Conversation.where(user2: current_user))
  end
end
