class Admin::UploadsController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin" 
  before_filter :load_combos
  
  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      redirect_to [:admin, @upload], :notice => "Successfully created upload."
    else
      render :action => 'new'
    end
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      redirect_to [:admin, @upload], :notice  => "Successfully updated upload."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to admin_uploads_url, :notice => "Successfully destroyed upload."
  end
  
  def load_combos
    @upload_categories = UploadCategory.all.collect { |c| [c.name, c.id] }
  end
end
