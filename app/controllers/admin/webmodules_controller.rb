class Admin::WebmodulesController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin", :except => :popula_ids
  before_filter :load_template   
  def index
    @webmodules = @template.webmodules.all_active
  end

  def show
    @webmodule = @template.webmodules.find(params[:id])
  end

  def new
    @webmodule = @template.webmodules.build(:published => true)
    @webparts = Webpart.all_published
  end

  def create
    @webmodule = @template.webmodules.build(params[:webmodule])
    @webmodule.active = true
    
    if !params[:module_key].blank?
      @webmodule.module_key = params[:module_key]
    end
    
    if @webmodule.save
      redirect_to admin_template_webmodule_path(@template, @webmodule), :notice => "Successfully created webmodule."
    else
      render :action => 'new'
    end
  end

  def edit
    @webmodule = @template.webmodules.find(params[:id])
    @webparts = Webpart.all_published
  end

  def update
    @webmodule = @template.webmodules.find(params[:id])
    
    if !params[:module_key].blank?
      @webmodule.module_key = params[:module_key]
    end
    
    if @webmodule.update_attributes(params[:webmodule])
      redirect_to admin_template_webmodule_path(@template, @webmodule), :notice  => "Successfully updated webmodule."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @webmodule = @template.webmodules.find(params[:id])
    @webmodule.newdestroy
    redirect_to admin_template_webmodules_path(@template), :notice => "Successfully destroyed webmodule."
  end

  def load_template
    @template = Template.find(params[:template_id])
  end
  
  def buttoms
    
  end
  
  def popula_ids
    @Webpart = Webpart.find(params[:webpart])
    #@Cidades = Reseller.all(:conditions => ['state = ? and active =  true', params[:estado]], :group => "city", :order => "city ASC")
  end
    
end
