class UserRegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, :only => [:create]
  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
  end
end
