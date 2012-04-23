class Banner < ActiveRecord::Base
  has_attached_file :file, :styles => { :thumb => "50x50>"}
end
