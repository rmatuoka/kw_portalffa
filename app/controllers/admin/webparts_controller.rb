class Admin::WebpartsController < ApplicationController
  def index
    @webparts = Webpart.all
  end

  def show
    @webpart = Webpart.find(params[:id])
  end

  def new
    @webpart = Webpart.new
  end

  def create
    @webpart = Webpart.new(params[:webpart])
    if @webpart.save
      redirect_to [:admin, @webpart], :notice => "Successfully created webpart."
    else
      render :action => 'new'
    end
  end

  def edit
    @webpart = Webpart.find(params[:id])
  end

  def update
    @webpart = Webpart.find(params[:id])
    if @webpart.update_attributes(params[:webpart])
      redirect_to [:admin, @webpart], :notice  => "Successfully updated webpart."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @webpart = Webpart.find(params[:id])
    @webpart.destroy
    redirect_to admin_webparts_url, :notice => "Successfully destroyed webpart."
  end
end
