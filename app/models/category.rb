class Category < ActiveRecord::Base
  #attr_accessible :name, :active, :published
  belongs_to :template
  has_many :subcategories, :dependent => :destroy
  
  validates_presence_of :name  
  validates_presence_of :template_id  
  
  has_attached_file :background, :styles => { :thumb => "150x150>"}
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
end
