class BannersController < ApplicationController
  def index
  end
  
  def show
    @Banner = Banner.find(params[:id])
    @Banner.clicks = @Banner.clicks + 1 
    @Banner.save
    redirect_to @Banner.link
  end
end
