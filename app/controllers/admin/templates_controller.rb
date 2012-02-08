class Admin::TemplatesController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  
  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(params[:template])
    if @template.save
      redirect_to [:admin, @template], :notice => "Successfully created template."
    else
      render :action => 'new'
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    if @template.update_attributes(params[:template])
      redirect_to [:admin, @template], :notice  => "Successfully updated template."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to admin_templates_url, :notice => "Successfully destroyed template."
  end
end
