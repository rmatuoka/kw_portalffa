class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :name
      t.date :ticket_date
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :ticket_type_id
      t.integer :ticket_category_id
      t.integer :above
      t.decimal :discount, :precision => 10, :scale => 2
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
