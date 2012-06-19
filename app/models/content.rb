class Content < ActiveRecord::Base
  has_attached_file :icon_menu, :styles => { :menu_size => "77x63>"}, :default_url => "/system/icon_menus/default.jpg"
  
  has_attached_file :icon_home, :styles => { :menu_size => "90x90>"}
  #attr_accessible :subcategory_id, :template_id, :content, :active, :published
  belongs_to :subcategory
  belongs_to :template 
  has_many :webmodules 
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
  def self.all_published_menu_desc
    all(:conditions => ['active =  true and published = true and menu_display = true'], :order => '`contents`.`id` desc')
  end
  
end
