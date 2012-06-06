class Upload < ActiveRecord::Base 
  has_attached_file :file, :styles => { :thumb => "50x50>", :gallery => "476x312>", :gallery_thumb => "106x71>", :large_image =>"960x590>", :gallery_highlight => "345x365>"}
  
  validates_presence_of :upload_category_id
  validates_presence_of :description
  belongs_to :upload_category
  has_many :gallery_images
  
  def self.all_images
    Upload.all(:conditions => ["file_content_type = 'image/jpeg'"])
  end
end
