class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  private

    def callback_from(provider)
      provider = provider.to_s

      @user = User.find_or_create_from_oauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success',
                                kind: provider.capitalize)
        session[:user_id] = @user.id
        sign_in_and_redirect @user, event: :authentication
      else
        session["devise.#{provider}_data"] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def after_sign_in_path_for(_resource)
      my_page_path
    end
end
