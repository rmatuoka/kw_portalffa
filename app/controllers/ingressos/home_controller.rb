class Ingressos::HomeController < ApplicationController
 # access_control do
 #      allow logged_in, :all
 #  end  
 
  layout "template2012" 
  before_filter :load_menu  
  
  def index
    @ticket_homes = TicketHome.all_active  
    @tickets = Ticket.all(
                          :conditions => ['active = 1 and published = 1 and ticket_date >= curdate() + 1'],
                          :include => [:ticket_category, :ticket_type],
                          :order => 'ticket_category_id, ticket_date, ticket_type_id')
    create_template(4)
  end

end
