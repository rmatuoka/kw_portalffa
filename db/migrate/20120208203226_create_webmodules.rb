class CreateWebmodules < ActiveRecord::Migration
  def self.up
    create_table :webmodules do |t|
      t.integer :template_id
      t.integer :webpart_id
      t.integer :position
      t.text :module_key
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :webmodules
  end
end
