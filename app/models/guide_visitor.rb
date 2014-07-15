class GuideVisitor < ActiveRecord::Base
  attr_accessible :guide_id, :year, :visit, :passengers, :active
  belongs_to :guide
  validates_presence_of :guide_id  
end
