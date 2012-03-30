class Template < ActiveRecord::Base
  #attr_accessible :name, :active, :published
  has_many :webmodules, :dependent => :destroy
  has_many :categories  
  has_many :contents  
end
