class TargetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @target = current_user.targets.create(target_params)
    if @target.save
      @target
    else
      render json: { errors: @target.errors }, status: :unprocessable_entity
    end
  end

  def index
    @targets = current_user.targets
  end

  def destroy
    @target = current_user.targets.find(params[:id])
    @target.destroy
  end

  private

  def target_params
    params.require(:target).permit(:title, :radius, :topic_id, :latitude, :longitude)
  end
end
