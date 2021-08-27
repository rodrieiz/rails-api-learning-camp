class RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :authenticate_user!

  private

  def sign_up_params
    params.require(:user).permit(:email, :gender, :password, :password_confirmation)
  end
end
