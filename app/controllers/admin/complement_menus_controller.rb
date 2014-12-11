class Admin::ComplementMenusController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin"
  layout "admin_20141208"  
  def index
    @complement_menus = ComplementMenu.all
  end

  def show
    @complement_menu = ComplementMenu.find(params[:id])
  end

  def new
    @complement_menu = ComplementMenu.new(:published => true)
  end

  def create
    @complement_menu = ComplementMenu.new(params[:complement_menu])
    @complement_menu.active = true
    if @complement_menu.save
      redirect_to [:admin, @complement_menu], :notice => "Successfully created complement menu."
    else
      render :action => 'new'
    end
  end

  def edit
    @complement_menu = ComplementMenu.find(params[:id])
  end

  def update
    @complement_menu = ComplementMenu.find(params[:id])
    if @complement_menu.update_attributes(params[:complement_menu])
      redirect_to [:admin, @complement_menu], :notice  => "Successfully updated complement menu."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @complement_menu = ComplementMenu.find(params[:id])
    @complement_menu.newdestroy
    redirect_to admin_complement_menus_url, :notice => "Successfully destroyed complement menu."
  end
end
