class Admin::ContentsController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  def index
    @contents = Content.all_active
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new(:published => true)
  end

  def create
    @content = Content.new(params[:content])
    @content.active = true
    if @content.save
      redirect_to [:admin, @content], :notice => "Successfully created content."
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
      redirect_to [:admin, @content], :notice  => "Successfully updated content."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.newdestroy
    redirect_to admin_contents_url, :notice => "Successfully destroyed content."
  end
end
