class Admin::StaticContentsController < ApplicationController  
  access_control do
      allow :admin, :to => [:index]
      allow :supervisor, :to => [:index]
  end
  
  layout "inadmin"  
    
  def index
    
  end
end
