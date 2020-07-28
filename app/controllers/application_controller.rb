class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, users_departments_attributes: [:department_id, :position_id], users_factories_attributes: [:factory_id]])
  end
end
