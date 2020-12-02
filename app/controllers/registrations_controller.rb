class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

 # Removed for deployment
 # def create
 #  super
 #  UserMailer.welcome_email(@user).deliver_now
 # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
    
  def account_update_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation, :current_password)
  end
end
