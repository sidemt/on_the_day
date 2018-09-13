class UsersController < ApplicationController
  before_action :logged_in_user

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Success
      flash[:success] = 'Profile updated'
      redirect_to my_page_path
    else
      # Failure
      # => @user.errors.full_messages()
      render 'my_page'
    end
  end

  private

    def user_params
      params.require(:user).permit(:day)
    end
end
