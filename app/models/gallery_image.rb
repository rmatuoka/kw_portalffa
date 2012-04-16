class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :upload
end
