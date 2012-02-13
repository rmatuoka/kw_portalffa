class Category < ActiveRecord::Base
  #attr_accessible :name, :active, :published
  has_many :subcategory, :dependent => :destroy
end
