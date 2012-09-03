class Admin::TicketsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"
  before_filter :load_combos
  
  def index
    @tickets = Ticket.all_active
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new(:published => true)
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.active = true
    if @ticket.save
      redirect_to [:admin, @ticket], :notice => "Successfully created ticket."
    else
      render :action => 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to [:admin, @ticket], :notice  => "Successfully updated ticket."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.newdestroy
    redirect_to admin_tickets_url, :notice => "Successfully destroyed ticket."
  end
  
  def load_combos
    @ticket_categories = TicketCategory.all.collect { |c| [c.name, c.id] }
    @ticket_types = TicketType.all.collect { |c| [c.name, c.id] }
  end
end
