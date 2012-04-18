class Admin::ContentsController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  $load_template_id = 3
  before_filter :load_template, :only => [:new, :edit]  
  before_filter :load_subcategories
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :theme_advanced_buttons1 => %w{ newdocument | bold italic underline strikethrough | justifyleft justifycenter justifyright justifyfull styleselect formatselect fontselect fontsizeselect },
                              :theme_advanced_buttons2 => %w{ cut copy paste pastetext pasteword | search replace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image cleanup help code | insertdate inserttime preview | forecolor backcolor},
                              :theme_advanced_buttons3 => %w{ tablecontrols | hr removeformat visualaid | sub sup | charmap emotions iespell media advhr | print | ltr rtl | fullscreen},
                              :theme_advanced_buttons4 => %w{ insertlayer moveforward movebackward absolute | styleprops | cite abbr acronym del ins attribs | visualchars nonbreaking pagebreak},
                              #:plugins => %w{ table fullscreen }
                              :plugins => %w{ safari pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template},
                              :width =>"100%",
                            	:height =>"400"
                            }  

  def index
    @contents = @subcategory.contents.all_active
  end

  def show
    @content = @subcategory.contents.find(params[:id])
  end

  def new
    @content = @subcategory.contents.buildnew(:published=> true, :menu_display => true)
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
