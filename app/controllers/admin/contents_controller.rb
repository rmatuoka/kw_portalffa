class Admin::ContentsController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :theme_advanced_buttons1 => %w{ table fullscreen save  },
                              #:plugins => %w{ table fullscreen }
                              :plugins => %w{ table fullscreen save  },
                              :width =>"100%",
                            	:height =>"400"
                            }  
  before_filter :load_subcategories
  def index
    @contents = @subcategory.contents.all_active
  end

  def show
    @content = @subcategory.contents.find(params[:id])
  end

  def new
    @content = @subcategory.contents.build(:published => true)
    @templates = Template.all_published    
  end

  def create
    @content = @subcategory.contents.build(params[:content])
    @content.active = true
    if @content.save
      redirect_to admin_category_subcategory_content_path(@category, @subcategory, @content), :notice => "Successfully created content."
    else
      render :action => 'new'
    end
  end

  def edit
    @content = Content.find(params[:id])
    @templates = Template.all_published    
  end

  def update
    @content = Content.find(params[:id])
    if @content.update_attributes(params[:content])
      redirect_to admin_category_subcategory_content_path(@category, @subcategory, @content), :notice  => "Successfully updated content."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.newdestroy
    redirect_to admin_category_subcategory_contents_path(@category, @subcategory), :notice => "Successfully destroyed content."
  end
  
  def load_subcategories
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
  end
end
