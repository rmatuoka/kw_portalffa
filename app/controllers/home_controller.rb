class HomeController < ApplicationController
  layout "template2012" 
  before_filter :load_menu   
 
  def index
    
    @Position1 = nil
    @Position2 = nil
    @Position3 = nil
    @Position4 = nil
    @Position5 = nil
    @Position6 = nil
    @Position7 = nil
    @Position8 = nil
    @Position9 = nil
    @Position10 = nil
    @Position11 = nil
    @Position12 = nil
    @Position13 = nil
    @Position14 = nil
    @Position15 = nil    
        
    @Template = ::Template.find(:all,:conditions => "`templates`.`id` = 1")
    if @Template.count > 0
        @WebModules = @Template.first.webmodules.all_published
    
        @WebModules.each do |modulo|
          case modulo.position
            when 1
              @Position1 = modulo
              #@Position1 = "<div style='width: 345px; height: 341px'>"+modulo.module_key+"</div>"
            when 2
              @Position2 = modulo
            when 3
              @Position3 = modulo    
            when 4      
              @Position4 = modulo                    
            when 5
              @Position5 = modulo
            when 6
              @Position6 = modulo
            when 7
              @Position7 = modulo
            when 8
              @Position8 = modulo
            when 9
              @Position9 = modulo
            when 10
              @Position10 = modulo
            when 11
              @Position11 = modulo
            when 12
              @Position12 = modulo
            when 13
              @Position13 = modulo                            
            when 14
              @Position14 = modulo
            when 15
              @Position15 = modulo                            
            else
              puts "Fodeu"
          end
        end
    end
  end

end
