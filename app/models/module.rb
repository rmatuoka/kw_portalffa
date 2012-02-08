class Module < ActiveRecord::Base
  #attr_accessible :template_id, :webpart_id, :position, :module_key, :active, :published
  belongs_to :template
  belongs_to :webpart
end
