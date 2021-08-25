class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    render json: {
      status: 200,
      success: true,
      message: I18n.t('confirmations.confirmed_account')
    }
  end
end
