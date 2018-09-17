class UsersController < ApplicationController
  before_action :logged_in_user

  def update
    logged_in_user
    @user = current_user
    if @user.update(user_params)
      # Success
      flash[:success] = 'Updated'
      redirect_to my_page_path
    else
      flash[:danger] = @user.errors.full_messages()
      render 'my_page'
    end
  end

  private

    def user_params
      params.require(:user).permit(:day)
    end
end
