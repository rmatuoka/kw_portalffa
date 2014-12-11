class Admin::StaticContentsController < ApplicationController  
  access_control do
      allow :admin, :to => [:index]
      allow :supervisor, :to => [:index]
  end
  
  #layout "inadmin" 
  layout "admin_20141208" 
    
  def index
    
  end
end
