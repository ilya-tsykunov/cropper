class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_new_event_notifications, if: :user_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name send_notification))
  end

  def check_new_event_notifications
    if current_user.event_notifications.unwatched.exists?
      current_user.event_notifications.unwatched.update_all(watched: true)
      flash.now[:notice] = 'There are new events that can be interesting for you'
    end
  end
end
