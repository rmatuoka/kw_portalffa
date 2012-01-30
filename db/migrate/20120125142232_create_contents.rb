class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.integer :subcategory_id
      t.integer :template_id
      t.text :content
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
