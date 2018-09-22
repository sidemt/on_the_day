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

  def count_up_day
    @user = current_user
    @user.day = add_day_num(@user.day)

    if @user.save
      flash[:success] = 'Well done!'
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_to my_page_path
  end

  def add_day_num(day_num)
    day = if day_num < 100
            day_num + 1 # Increase the Day by 1
          else
            1 # Set the Day back to 1
          end
    return day
  end

  private

    def user_params
      params.require(:user).permit(:day)
    end
end
