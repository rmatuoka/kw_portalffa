class GuideVisitor < ActiveRecord::Base
  attr_accessible :guide_id, :year, :visit, :passengers, :active
end
