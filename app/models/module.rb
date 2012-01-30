class Module < ActiveRecord::Base
  attr_accessible :template_id, :webpart_id, :position, :module_key, :active, :published
end
