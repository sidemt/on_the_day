class StaticPagesController < ApplicationController
  def home
    @day = params[:day]
    respond_to do |format|
      format.html
    end
  end
end
