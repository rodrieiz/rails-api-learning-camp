module AuthSpecHelper
  def user_auth_headers
    @user = create(:user)
    @auth_headers = @user.create_new_auth_token
  end
end
