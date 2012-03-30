class Category < ActiveRecord::Base
  #attr_accessible :name, :active, :published
  belongs_to :template
  has_many :subcategories, :dependent => :destroy
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
end
