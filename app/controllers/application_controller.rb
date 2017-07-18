class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  #acces to landingPage to not Authenticated user
  skip_before_action :authenticate_user!, :only => [:landing]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :document, :phone, :birthdate, :neighborhood])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :document, :phone, :birthdate, :neighborhood])
  end



  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.has_role? :MasterAdmin
        rails_admin_path
      elsif resource.has_role? :Admin
        #posiblemente a asiganar rutas o a visualizar flota
        #_path
        root_path
      elsif resource.has_role? :RegularUser
        basic_welcome_path
      else
        root_path
      end
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

end
