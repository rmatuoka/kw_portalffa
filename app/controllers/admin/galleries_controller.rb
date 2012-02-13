class Admin::GalleriesController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  def index
    @galleries = Gallery.all_active
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new(:published => true)
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    @gallery.active = true
    if @gallery.save
      redirect_to [:admin, @gallery], :notice => "Successfully created gallery."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to [:admin, @gallery], :notice  => "Successfully updated gallery."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.newdestroy
    redirect_to admin_galleries_url, :notice => "Successfully destroyed gallery."
  end
end
