class TargetsController < ApplicationController
  def create
    @target = current_user.targets.create(target_params)
    if @target.save
      @matches = FindMatch.new(@target, current_user).search
      @target
    else
      render json: { errors: @target.errors }, status: :unprocessable_entity
    end
  end

  def index
    @targets = current_user.targets
  end

  def destroy
    @target = current_user.targets.find_by(id: params[:id])
    if @target.nil?
      render json: { errors: 'Target not found' }, status: :not_found
    else
      @target.destroy
    end
  end

  private

  def target_params
    params.require(:target).permit(:title, :radius, :topic_id, :latitude, :longitude)
  end
end
