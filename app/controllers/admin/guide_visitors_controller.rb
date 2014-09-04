class Admin::GuideVisitorsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
      allow :register, :all
  end
  layout "new_admin"  
  before_filter :load_guide
  def index
    @guide_visitors = GuideVisitor.all_active
  end

  def show
    @guide_visitor = GuideVisitor.find(params[:id]) 
  end

  def new
    @guide_visitor = GuideVisitor.new
  end

  def create
    @guide_visitor = GuideVisitor.new(params[:guide_visitor])
    if @guide_visitor.year.blank?
      @guide_visitor.year = Time.now
    end
    if @guide_visitor.save
      redirect_to [:admin, @guide_visitor], :notice => "Successfully created guide visitor."
    else
      render :action => 'new'
    end
  end

  def edit
    @guide_visitor = GuideVisitor.find(params[:id])
  end

  def update
    @guide_visitor = GuideVisitor.find(params[:id])
    if @guide_visitor.update_attributes(params[:guide_visitor])
      redirect_to [:admin, @guide_visitor], :notice  => "Successfully updated guide visitor."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guide_visitor = GuideVisitor.find(params[:id])
    @guide_visitor.newdestroy
    redirect_to admin_guide_visitors_url, :notice => "Successfully destroyed guide visitor."
  end
  
  def load_guide
    @guides = Guide.all_active.collect { |c| [c.name, c.id] } 
    @pag_show = 3
  end
end
