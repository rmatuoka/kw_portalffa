class HomeController < ApplicationController
  layout "template2012" 
  before_filter :load_menu   
 
  def index 
    create_template(1)        
  end

end
