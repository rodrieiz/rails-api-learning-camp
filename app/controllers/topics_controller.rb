class TopicsController < ApplicationController
  
  # GET /topics
  def index
    @topics = Topic.all

    render json: @topics
  end

end
