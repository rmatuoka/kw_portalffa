class Admin::BannersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin"
  layout "admin_20141208"
  
  def index
    @banners = Banner.all_active
  end

  def show
    @banner = Banner.find(params[:id])
  end

  def new
    @banner = Banner.new(:published => true)
  end

  def create
    @banner = Banner.new(params[:banner])
    @banner.active = true
    if @banner.save
      redirect_to [:admin, @banner], :notice => "Successfully created banner."
    else
      render :action => 'new'
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update_attributes(params[:banner])
      redirect_to [:admin, @banner], :notice  => "Successfully updated banner."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.newdestroy
    redirect_to admin_banners_url, :notice => "Successfully destroyed banner."
  end
end
