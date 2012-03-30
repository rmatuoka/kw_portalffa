class Subcategory < ActiveRecord::Base
  #attr_accessible :category_id, :template_id, :name, :active, :published
  belongs_to :category
  has_many :contents, :dependent => :destroy
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
end
