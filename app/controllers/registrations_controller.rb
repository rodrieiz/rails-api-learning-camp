class RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :gender, :password, :password_confirmation)
  end
end
