class AddNameToTicketHome < ActiveRecord::Migration
  def self.up
    add_column :ticket_homes, :name, :string
  end

  def self.down
    remove_column :ticket_homes, :name
  end
end
