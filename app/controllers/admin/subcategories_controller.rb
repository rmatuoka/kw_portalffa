class Admin::SubcategoriesController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  def index
    @subcategories = Subcategory.all_active
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @subcategory = Subcategory.new(:published => true)
  end

  def create
    @subcategory = Subcategory.new(params[:subcategory])
    @subcategory.active = true
    if @subcategory.save
      redirect_to [:admin, @subcategory], :notice => "Successfully created subcategory."
    else
      render :action => 'new'
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(params[:subcategory])
      redirect_to [:admin, @subcategory], :notice  => "Successfully updated subcategory."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.newdestroy
    redirect_to admin_subcategories_url, :notice => "Successfully destroyed subcategory."
  end
end
