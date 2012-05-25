class Ingressos::ConfiraController < ApplicationController
  access_control do
      allow logged_in, :all
  end  
  layout "template2012" 
  before_filter :load_menu
  
  def index
      @carts = current_user.carts.all(:joins => 'INNER JOIN `tickets` ON `carts`.`ticket_id` = `tickets`.`id`',
                                      :order => '`tickets`.`ticket_category_id`, `tickets`.`ticket_date`')
  	  if @carts.empty?
    		flash[:alert] = true;
    		redirect_to ingressos_selecione_index_path
      end
      @total_final = 0 
      create_template(4)   
  end
end
