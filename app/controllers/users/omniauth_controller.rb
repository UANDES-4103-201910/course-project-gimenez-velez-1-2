class Users::OmniauthController < Devise::RegistrationsController
  # google callback
  def google_oauth2
    auth = request.env['omniauth.auth']
    @user = User.create_from_provider_data(auth)
    if @user.persisted?
      @user.name = auth["info"]["first_name"]
      @user.lastname = auth["info"]["last_name"]
      @user.password = auth["info"]["password"]
      @user.save
      sign_in_and_redirect @user
      flash[:notice] = 'Su cuenta de Google ha sido registrada exitosamente.'
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end
    def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end
