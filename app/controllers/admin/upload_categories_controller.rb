class Admin::UploadCategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin" 
  layout "admin_20141208"
  
  def index
    @upload_categories = UploadCategory.all
  end

  def show
    @upload_category = UploadCategory.find(params[:id])
  end

  def new
    @upload_category = UploadCategory.new
  end

  def create
    @upload_category = UploadCategory.new(params[:upload_category])
    if @upload_category.save
      redirect_to [:admin, @upload_category], :notice => "Successfully created upload category."
    else
      render :action => 'new'
    end
  end

  def edit
    @upload_category = UploadCategory.find(params[:id])
  end

  def update
    @upload_category = UploadCategory.find(params[:id])
    if @upload_category.update_attributes(params[:upload_category])
      redirect_to [:admin, @upload_category], :notice  => "Successfully updated upload category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @upload_category = UploadCategory.find(params[:id])
    @upload_category.destroy
    redirect_to admin_upload_categories_url, :notice => "Successfully destroyed upload category."
  end
end
