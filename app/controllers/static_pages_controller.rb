class StaticPagesController < ApplicationController
  def home; end

  def search
    @day = params[:day].to_i
    respond_to do |format|
      format.html
    end
  end
end
