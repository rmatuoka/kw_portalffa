class AddCompletedLinksToGalleryImage < ActiveRecord::Migration
  def self.up
    add_column :gallery_images, :link, :string
    add_column :gallery_images, :link_target, :string
  end

  def self.down
    remove_column :gallery_images, :link_target
    remove_column :gallery_images, :link
  end
end
