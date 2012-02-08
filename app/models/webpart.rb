class Webpart < ActiveRecord::Base
  #attr_accessible :name, :encoding, :type, :active, :published
    has_many :modules
       
end
