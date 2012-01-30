class Gallery < ActiveRecord::Base
  attr_accessible :content_id, :name, :description, :active, :published
end
