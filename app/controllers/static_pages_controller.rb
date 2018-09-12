class StaticPagesController < ApplicationController
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
