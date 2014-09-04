class Admin::GuidesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  before_filter :load_types
  def index
    @guides = Guide.all_active.paginate :page => params[:page],:per_page => 100 
  end

  def show
    @guide = Guide.find(params[:id]) 
    @guide_visitors = @guide.guide_visitors.all_active 
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    if @guide.save
      if ((params[:has_visit] == "1") && (params[:visit_quantity].to_i > 0)) 
        puts "Passou"
        @guide_visitor = GuideVisitor.new(:guide_id => @guide.id, :year => Time.now, :passengers => params[:visit_quantity])
        @guide_visitor.save 
      end
      redirect_to [:admin, @guide], :notice => "Successfully created guide."
    else
      render :action => 'new'
    end
  end

  def edit
    @guide = Guide.find(params[:id])
    @guide_visitors = @guide.guide_visitors.all_active 
  end

  def update
    @guide = Guide.find(params[:id])
    if @guide.update_attributes(params[:guide])
      if ((params[:has_visit] == "1") && (params[:visit_quantity].to_i > 0)) 
        puts "Passou"
        @guide_visitor = GuideVisitor.new(:guide_id => @guide.id, :year => Time.now, :passengers => params[:visit_quantity])
        @guide_visitor.save 
      end            
      redirect_to [:admin, @guide], :notice  => "Successfully updated guide."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guide = Guide.find(params[:id])
    @guide.newdestroy
    redirect_to admin_guides_url, :notice => "Successfully destroyed guide."
  end
  
  def search
    if !params[:keyword].blank?
      @guides = Guide.search_for(params[:keyword]).paginate :page => params[:page],:per_page => 100 
    else
      @guides = Guide.all_active 
    end
    render :action => 'index' 
  end
  
  def load_types
    @guide_types = GuideType.all_active.collect { |c| ["#{c.code} - #{c.description}", c.id] } 
  end
  
end
