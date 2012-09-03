class Admin::SubcategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  before_filter :load_categories
  def index
    @subcategories = @category.subcategories.all_active
  end

  def show
    @subcategory = @category.subcategories.find(params[:id])
  end

  def new
    @subcategory = @category.subcategories.build(:published=> true, :menu_display => true)
  end

  def create
    @subcategory = @category.subcategories.build(params[:subcategory])
    @subcategory.active = true
    if @subcategory.save
      redirect_to admin_category_subcategory_path(@category,@subcategory), :notice => "Successfully created subcategory."
    else
      render :action => 'new'
    end
  end

  def edit
    @subcategory = @category.subcategories.find(params[:id])
  end

  def update
    @subcategory = @category.subcategories.find(params[:id])
    if @subcategory.update_attributes(params[:subcategory])
      redirect_to admin_category_subcategory_path(@category,@subcategory), :notice  => "Successfully updated subcategory."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.newdestroy
    redirect_to admin_category_subcategories_path(@category), :notice => "Successfully destroyed subcategory."
  end
  
  def load_categories
    @category = Category.find(params[:category_id])
  end
end
