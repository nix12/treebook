module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
  before_action :configure_permitted_parameters, if: :devise_controller?
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :profile_name << :email << :password << :password_confirmation << :user_id
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :profile_name << :email << :password << :password_confirmation << :user_id
  end

end

DeviseController.send :include, DevisePermittedParameters