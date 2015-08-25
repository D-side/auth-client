class AuthenticationController < Devise::OmniauthCallbacksController
  def auth_server
    @user = User.from_auth_server(request.env['omniauth.auth'])

    sign_in(@user)

    redirect_to root_path
  end

  def logout
    sign_out_and_redirect :user
  end

  protected

  def after_omniauth_failure_path_for(_)
    root_path
  end
end
