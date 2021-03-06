class Admin::ReportsController < ApplicationController
  access_control do
      allow :admin
  end
  #layout "inadmin"
  layout "admin_20141208"
  def index 
    @reports = OrderTicket.includes(:ticket).find(  :all,
                            :select => "`order_tickets`.`ticket_id`, sum(`order_tickets`.`amount`) as qtde,sum(`order_tickets`.`amount` * `order_tickets`.`price`) as total, sum(`order_tickets`.`reduction` * `order_tickets`.`amount`) as baixados",
                            :joins => "`order_tickets` INNER JOIN `orders` ON `orders`.`id` = `order_tickets`.`order_id`",
                            :conditions => ['`orders`.`status` = "completed" or `orders`.`status` = "approved"'],
                            :group => '`order_tickets`.`ticket_id`'
                          )
  end
end
