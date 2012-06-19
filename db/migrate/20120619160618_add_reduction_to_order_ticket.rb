class AddReductionToOrderTicket < ActiveRecord::Migration
  def self.up
    add_column :order_tickets, :reduction, :boolean
  end

  def self.down
    remove_column :order_tickets, :reduction
  end
end
