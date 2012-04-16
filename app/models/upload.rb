class Upload < ActiveRecord::Base 
  has_attached_file :file, :styles => { :thumb => "50x50>"}
  
  belongs_to :upload_category
  has_many :gallery_images
  
  def self.all_images
    Upload.all(:conditions => ["file_content_type = 'image/jpeg'"])
  end
end
