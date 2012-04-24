class FooterSite < ActiveRecord::Base
  #attr_accessible :name, :legend, :destination, :link_target, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :active, :published
    has_attached_file :image, :styles => { :pb => "100% x 100%" },:convert_options => { :pb => '-colorspace gray'}
    
    def self.all_published_order(orderasc = true)
      all(:conditions => ['active =  true and published = true'], :order => "footer_type")
    end    
end
