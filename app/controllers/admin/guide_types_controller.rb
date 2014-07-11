class Admin::GuideTypesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"

  def index
    @guide_types = GuideType.all_active
  end

  def show
    @guide_type = GuideType.find(params[:id])
  end

  def new
    @guide_type = GuideType.new
  end

  def create
    @guide_type = GuideType.new(params[:guide_type])
    if @guide_type.save
      redirect_to [:admin, @guide_type], :notice => "Successfully created guide type."
    else
      render :action => 'new'
    end
  end

  def edit
    @guide_type = GuideType.find(params[:id])
  end

  def update
    @guide_type = GuideType.find(params[:id])
    if @guide_type.update_attributes(params[:guide_type])
      redirect_to [:admin, @guide_type], :notice  => "Successfully updated guide type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guide_type = GuideType.find(params[:id])
    @guide_type.newdestroy
    redirect_to admin_guide_types_url, :notice => "Successfully destroyed guide type."
  end
end
