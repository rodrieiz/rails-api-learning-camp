class TopicsController < ApplicationController
  before_action :authenticate_user!
  # GET /topics
  def index
    @topics = Topic.all
  end
end
