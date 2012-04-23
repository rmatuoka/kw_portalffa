class Admin::FooterSitesController < ApplicationController
  def index
    @footer_sites = FooterSite.all
  end

  def show
    @footer_site = FooterSite.find(params[:id])
  end

  def new
    @footer_site = FooterSite.new
  end

  def create
    @footer_site = FooterSite.new(params[:footer_site])
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
    @footer_site.destroy
    redirect_to admin_footer_sites_url, :notice => "Successfully destroyed footer site."
  end
end
