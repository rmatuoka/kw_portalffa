class CreateModules < ActiveRecord::Migration
  def self.up
    create_table :modules do |t|
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
    drop_table :modules
  end
end
