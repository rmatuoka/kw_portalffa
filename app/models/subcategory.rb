class Subcategory < ActiveRecord::Base
  attr_accessible :category_id, :template_id, :name, :active, :published
end
