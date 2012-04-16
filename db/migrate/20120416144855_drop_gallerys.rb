class DropGallerys < ActiveRecord::Migration
  def self.up
    drop_table :galleries
    drop_table :gallery_images
  end

  def self.down
  end
end
