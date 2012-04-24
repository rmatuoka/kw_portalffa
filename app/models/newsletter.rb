class Newsletter < ActiveRecord::Base
  attr_accessible :email, :active, :published
end
