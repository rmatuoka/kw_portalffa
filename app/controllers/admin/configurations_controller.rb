class Admin::ConfigurationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"  
  
  def index
    @configurations = Configuration.all_active
    if (@configurations.count > 0)
      redirect_to admin_configuration_path(@configurations.first)
    else
      redirect_to new_admin_configuration_path
    end
    
  end

  def show
    @configuration = Configuration.find(params[:id])
  end

  def new
    @configurations = Configuration.all_active 
    if !(@configurations.count > 0)
      @configuration = Configuration.new
    else
      redirect_to admin_configurations_path
    end
  end

  def create
    @configuration = Configuration.new(params[:configuration])
    @configuration.published = true
    @configuration.active = true    
    if @configuration.save
      redirect_to [:admin, @configuration], :notice => "Successfully created configuration."
    else
      render :action => 'new'
    end
  end

  def edit
    @configuration = Configuration.find(params[:id])
  end

  def update
    @configuration = Configuration.find(params[:id])
    if @configuration.update_attributes(params[:configuration])
      redirect_to [:admin, @configuration], :notice  => "Successfully updated configuration."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @configuration = Configuration.find(params[:id])
    @configuration.newdestroy
    redirect_to admin_configurations_url, :notice => "Successfully destroyed configuration."
  end
end
