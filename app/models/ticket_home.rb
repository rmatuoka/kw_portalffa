class TicketHome < ActiveRecord::Base
  attr_accessible :content, :active, :published, :name
end
