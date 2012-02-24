class Subcategory < ActiveRecord::Base
  #attr_accessible :category_id, :template_id, :name, :active, :published
  belongs_to :category
  belongs_to :template
  has_many :contents, :dependent => :destroy
end
