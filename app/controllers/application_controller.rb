class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    # before action
    def logged_in_user
      return if user_signed_in?
      flash[:danger] = 'Please log in.'
      redirect_to root_url
    end
end
