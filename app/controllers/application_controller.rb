class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permited_parameters, if: :devise_controller?

  def configure_permited_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  		user_params.permit(:full_name,
  											 :email,
  											 :password,
  											 :password_confirmation)
  	end
  end
end
