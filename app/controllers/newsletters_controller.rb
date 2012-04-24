class NewslettersController < ApplicationController
  layout "blank"
  
  def index
  end
  
  def new
    @Newsletter = Newsletter.new
  end
  
  def create
    @Newsletter = Newsletter.new(params[:newsletter])
    
    if @Newsletter.save
      @erro = false
    else
      @erro = true
    end
  end
  
end
