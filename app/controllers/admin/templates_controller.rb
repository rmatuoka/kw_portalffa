class Admin::TemplatesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  
  def index
    @templates = Template.all_active
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new(:published => true)
  end

  def create
    @template = Template.new(params[:template])
    @template.active = true
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
    @template.newdestroy
    redirect_to admin_templates_url, :notice => "Successfully destroyed template."
  end
end
