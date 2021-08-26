class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.where(user1: current_user).or(Conversation.where(user2: current_user))
  end
end
