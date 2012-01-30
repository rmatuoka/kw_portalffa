class Category < ActiveRecord::Base
  attr_accessible :name, :active, :published
end
