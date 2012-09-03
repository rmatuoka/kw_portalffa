class Admin::TicketCategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  
  def index
    @ticket_categories = TicketCategory.all_active
  end

  def show
    @ticket_category = TicketCategory.find(params[:id])
  end

  def new
    @ticket_category = TicketCategory.new(:published => true)
  end

  def create
    @ticket_category = TicketCategory.new(params[:ticket_category])
    @ticket_category.active = true
    if @ticket_category.save
      redirect_to [:admin, @ticket_category], :notice => "Successfully created ticket category."
    else
      render :action => 'new'
    end
  end

  def edit
    @ticket_category = TicketCategory.find(params[:id])
  end

  def update
    @ticket_category = TicketCategory.find(params[:id])
    if @ticket_category.update_attributes(params[:ticket_category])
      redirect_to [:admin, @ticket_category], :notice  => "Successfully updated ticket category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ticket_category = TicketCategory.find(params[:id])
    @ticket_category.newdestroy
    redirect_to admin_ticket_categories_url, :notice => "Successfully destroyed ticket category."
  end
end
