class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:my_page]

  def home
    @day = params[:day]
    respond_to do |format|
      format.html
    end
  end

  def my_page
    @user = current_user
    @day = current_user.day
  end
end
