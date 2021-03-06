class Admin::CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin"
  layout "admin_20141208"
  before_filter :load_template, :only => [:new, :edit]

  def index
    @categories = Category.all_active
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new(:published=> true, :menu_display => true)
  end

  def create
    @category = Category.new(params[:category])
    @category.active = true
    if @category.save
      redirect_to [:admin, @category], :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id]) 
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to [:admin, @category], :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.newdestroy
    redirect_to admin_categories_url, :notice => "Successfully destroyed category."
  end
  
  def load_template
    @templates = Template.all_published_type(2)
  end
end
