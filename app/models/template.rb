class Template < ActiveRecord::Base
  #attr_accessible :name, :active, :published
  has_many :webmodules, :dependent => :destroy
  has_many :categories  
  has_many :contents  
  
  validates_presence_of :name  
  validates_presence_of :template_type
  
  def self.all_published_type(type)
    all(:conditions => ['active =  true and published = true and template_type = ?',type])
  end  

end
