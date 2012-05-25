class CreateTicketHomes < ActiveRecord::Migration
  def self.up
    create_table :ticket_homes do |t|
      t.text :content
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_homes
  end
end
