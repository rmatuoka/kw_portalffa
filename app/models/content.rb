class Content < ActiveRecord::Base
  #attr_accessible :subcategory_id, :template_id, :content, :active, :published
  belongs_to :subcategory
  belongs_to :template 
  has_many :webmodules 
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
end
