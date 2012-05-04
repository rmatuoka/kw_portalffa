class Ingressos::SelecioneController < ApplicationController
  access_control do
      allow logged_in, :all
  end  
  layout "template2012" 
  before_filter :load_menu
  
  def index
    #@categories = TicketCategory.all(:include => :tickets)
    @tickets = Ticket.all(
                          :conditions => ['active = 1 and published = 1 and ticket_date >= curdate() + 1'],
                          :include => [:ticket_category, :ticket_type],
                          :order => 'ticket_category_id, ticket_date')
    carts = current_user.carts.all
    @carts_hash = Hash.new
     i = 1
     carts.each do |c|
       @carts_hash[i]= c.ticket_id
       i = i+1
     end
     @cart = current_user.carts.build
	
  end

end
