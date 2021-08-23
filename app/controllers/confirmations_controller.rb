class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    render json: {
      status: 200,
      success: true,
      message: 'Your account has been confirmed'
    }
  end
end
