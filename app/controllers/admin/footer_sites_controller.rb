class Admin::FooterSitesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin"
  layout "admin_20141208"
  def index
    @footer_sites = FooterSite.all_active
  end

  def show
    @footer_site = FooterSite.find(params[:id])
  end

  def new
    @footer_site = FooterSite.new(:published=> true)
  end

  def create
    @footer_site = FooterSite.new(params[:footer_site])
    @footer_site.active = true
    if @footer_site.save
      redirect_to [:admin, @footer_site], :notice => "Successfully created footer site."
    else
      render :action => 'new'
    end
  end

  def edit
    @footer_site = FooterSite.find(params[:id])
  end

  def update
    @footer_site = FooterSite.find(params[:id])
    if @footer_site.update_attributes(params[:footer_site])
      redirect_to [:admin, @footer_site], :notice  => "Successfully updated footer site."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @footer_site = FooterSite.find(params[:id])
    @footer_site.newdestroy
    redirect_to admin_footer_sites_url, :notice => "Successfully destroyed footer site."
  end
end
