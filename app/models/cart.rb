class Cart < ActiveRecord::Base
  #attr_accessible :user_id, :ticket_id, :price, :amount
  belongs_to :user
  belongs_to :ticket
  
  def self.find_by_ticket(ticket_id)
    Cart.all(:conditions => ['ticket_id = ?', ticket_id])
  end  
end
