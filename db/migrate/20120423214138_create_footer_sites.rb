class CreateFooterSites < ActiveRecord::Migration
  def self.up
    create_table :footer_sites do |t|
      t.string :name
      t.string :legend
      t.string :destination
      t.string :link_target
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.boolean :active
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :footer_sites
  end
end
