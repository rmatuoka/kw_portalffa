class GuideType < ActiveRecord::Base
  attr_accessible :code, :description, :active
  has_many :guides
end
