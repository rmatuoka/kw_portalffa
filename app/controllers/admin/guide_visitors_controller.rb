class Admin::GuideVisitorsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"

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
end
