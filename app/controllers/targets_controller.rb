class TargetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @target = Target.create(target_params)
    @target.user = current_user
    @target.save
  end

  private

  def target_params
    params.require(:target).permit(:title, :radius, :topic_id, :latitude, :longitude)
  end

end
