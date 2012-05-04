class Ticket < ActiveRecord::Base
  belongs_to :ticket_category
  belongs_to :ticket_type
  has_many :carts
  has_many :order_tickets    
end
