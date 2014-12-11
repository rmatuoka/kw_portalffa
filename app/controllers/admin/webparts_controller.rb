class Admin::WebpartsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin"  
  layout "admin_20141208"
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :theme_advanced_buttons1 => %w{ table fullscreen save  },
                              #:plugins => %w{ table fullscreen }
                              :extended_valid_elements => "iframe[src|width|height|name|align]",
                              :plugins => %w{ table fullscreen save  },
                              :width =>"100%",
                            	:height =>"400"
                            }
  def index
    @webparts = Webpart.all_active #Alteração Importante
  end

  def show
    @webpart = Webpart.find(params[:id])
  end

  def new
    @webpart = Webpart.new(:published => true)#Alteração Importante
  end

  def create
    @webpart = Webpart.new(params[:webpart])
    @webpart.active = true #Alteração Importante define o item como ativo
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
    @webpart.newdestroy #Alteração Importante
    redirect_to admin_webparts_url, :notice => "Successfully destroyed webpart."
  end
end
