class Ingressos::HomeController < ApplicationController
 # access_control do
 #      allow logged_in, :all
 #  end  
 
  layout "template2012" 
  before_filter :load_menu  
  
  def index
    @ticket_homes = TicketHome.all_active
    create_template(4)
  end

end
