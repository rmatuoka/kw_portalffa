class Admin::TicketTypesController < ApplicationController
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  
  def index
    @ticket_types = TicketType.all_active
  end

  def show
    @ticket_type = TicketType.find(params[:id])
  end

  def new
    @ticket_type = TicketType.new(:published=> true)
  end

  def create
    @ticket_type = TicketType.new(params[:ticket_type])
    @ticket_type.active = true
    if @ticket_type.save
      redirect_to [:admin, @ticket_type], :notice => "Successfully created ticket type."
    else
      render :action => 'new'
    end
  end

  def edit
    @ticket_type = TicketType.find(params[:id])
  end

  def update
    @ticket_type = TicketType.find(params[:id])
    if @ticket_type.update_attributes(params[:ticket_type])
      redirect_to [:admin, @ticket_type], :notice  => "Successfully updated ticket type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ticket_type = TicketType.find(params[:id])
    @ticket_type.newdestroy
    redirect_to admin_ticket_types_url, :notice => "Successfully destroyed ticket type."
  end
end
