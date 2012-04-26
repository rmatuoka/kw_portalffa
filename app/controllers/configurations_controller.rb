class ConfigurationsController < ApplicationController
  def index
    @configurations = Configuration.all
  end

  def show
    @configuration = Configuration.find(params[:id])
  end

  def new
    @configuration = Configuration.new
  end

  def create
    @configuration = Configuration.new(params[:configuration])
    if @configuration.save
      redirect_to @configuration, :notice => "Successfully created configuration."
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
      redirect_to @configuration, :notice  => "Successfully updated configuration."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @configuration = Configuration.find(params[:id])
    @configuration.destroy
    redirect_to configurations_url, :notice => "Successfully destroyed configuration."
  end
end
