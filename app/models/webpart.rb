class Webpart < ActiveRecord::Base
  attr_accessible :name, :encoding, :type, :active, :published
end
