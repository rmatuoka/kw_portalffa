class GalleryImage < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :legend, :description, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :active, :published
end
