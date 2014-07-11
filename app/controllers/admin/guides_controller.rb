class Admin::GuidesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  
  def index
    @guides = Guide.all_active
  end

  def show
    @guide = Guide.find(params[:id])
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    if @guide.save
      redirect_to [:admin, @guide], :notice => "Successfully created guide."
    else
      render :action => 'new'
    end
  end

  def edit
    @guide = Guide.find(params[:id])
  end

  def update
    @guide = Guide.find(params[:id])
    if @guide.update_attributes(params[:guide])
      redirect_to [:admin, @guide], :notice  => "Successfully updated guide."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guide = Guide.find(params[:id])
    @guide.newdestroy
    redirect_to admin_guides_url, :notice => "Successfully destroyed guide."
  end
end
