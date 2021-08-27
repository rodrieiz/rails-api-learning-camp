class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  skip_before_action :authenticate_user!

  def show
    render json: {
      status: 200,
      success: true,
      message: I18n.t('confirmations.confirmed_account')
    }
  end
end
