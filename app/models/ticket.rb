class Ticket < ActiveRecord::Base
  belongs_to :ticket_category
  belongs_to :ticket_type
end
