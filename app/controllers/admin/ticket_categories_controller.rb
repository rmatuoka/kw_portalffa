class Admin::TicketCategoriesController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  
  def index
    @ticket_categories = TicketCategory.all
  end

  def show
    @ticket_category = TicketCategory.find(params[:id])
  end

  def new
    @ticket_category = TicketCategory.new
  end

  def create
    @ticket_category = TicketCategory.new(params[:ticket_category])
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
    @ticket_category.destroy
    redirect_to admin_ticket_categories_url, :notice => "Successfully destroyed ticket category."
  end
end
