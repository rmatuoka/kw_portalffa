class Admin::GalleryImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  before_filter :load_gallery
  
  def index
    @gallery_images = @gallery.gallery_images.all
  end

  def show
    @gallery_image = @gallery.gallery_images.find(params[:id])
  end

  def new
    @gallery_image = @gallery.gallery_images.build(:published=> true)
  end

  def create
    @gallery_image = @gallery.gallery_images.new(params[:gallery_image])
    @gallery_image.active = true
    if @gallery_image.save
      redirect_to [:admin, @gallery, @gallery_image], :notice => "Successfully created gallery image."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery_image = @gallery.gallery_images.find(params[:id])
  end

  def update
    @gallery_image = @gallery.gallery_images.find(params[:id])
    if @gallery_image.update_attributes(params[:gallery_image])
      redirect_to [:admin, @gallery, @gallery_image], :notice  => "Successfully updated gallery image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery_image = @gallery.gallery_images.find(params[:id])
    @gallery_image.destroy
    redirect_to admin_gallery_gallery_images_path(@gallery), :notice => "Successfully destroyed gallery image."
  end
  
  def load_gallery
    @gallery = Gallery.find(params[:gallery_id])
    @upload_images = Upload.all_images
  end
end
