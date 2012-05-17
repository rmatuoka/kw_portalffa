class Content < ActiveRecord::Base
  has_attached_file :icon_menu, :styles => { :menu_size => "77x63>"}, :default_url => "/system/icon_menus/default.jpg"
  #attr_accessible :subcategory_id, :template_id, :content, :active, :published
  belongs_to :subcategory
  belongs_to :template 
  has_many :webmodules 
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
end
