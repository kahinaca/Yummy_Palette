class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters

    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :cuisine_id, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def default_url_options
  { host: ENV["heroku config:set DOMAIN=www.yummypaletteapp.com"] || "localhost:3000" }
  end

end
