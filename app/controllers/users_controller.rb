class UsersController < ApplicationController
  before_action :logged_in_user

  def update
    @user = current_user
    if @user.update(user_params)
      # Success
      flash[:success] = 'Updated'
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_to my_page_path
  end

  private

    def user_params
      params.require(:user).permit(:day)
    end
end
