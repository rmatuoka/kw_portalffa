class Admin::ModulesController < ApplicationController
  def index
    @modules = Module.all
  end

  def show
    @module = Module.find(params[:id])
  end

  def new
    @module = Module.new
  end

  def create
    @module = Module.new(params[:module])
    if @module.save
      redirect_to [:admin, @module], :notice => "Successfully created module."
    else
      render :action => 'new'
    end
  end

  def edit
    @module = Module.find(params[:id])
  end

  def update
    @module = Module.find(params[:id])
    if @module.update_attributes(params[:module])
      redirect_to [:admin, @module], :notice  => "Successfully updated module."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @module = Module.find(params[:id])
    @module.destroy
    redirect_to admin_modules_url, :notice => "Successfully destroyed module."
  end
end
