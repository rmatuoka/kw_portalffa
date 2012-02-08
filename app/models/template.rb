class Template < ActiveRecord::Base
  #attr_accessible :name, :active, :published
  has_many :modules, :dependent => :destroy
end
