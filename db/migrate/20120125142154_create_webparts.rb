class CreateWebparts < ActiveRecord::Migration
  def self.up
    create_table :webparts do |t|
      t.string :name
      t.text :encoding
      t.string :type
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :webparts
  end
end
