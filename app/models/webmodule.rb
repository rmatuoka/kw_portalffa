class Webmodule < ActiveRecord::Base
  #attr_accessible :template_id, :webpart_id, :position, :module_key, :active, :published
  belongs_to :template
  belongs_to :webpart
  belongs_to :content
end
