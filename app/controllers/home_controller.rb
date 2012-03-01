class HomeController < ApplicationController
  layout "templatehome"    
 
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
        
    @Template = ::Template.all
    if @Template.count > 0
        @WebModules = @Template.first.webmodules.all_published
    
        @WebModules.each do |modulo|
          case modulo.position
            when 1
              @Position1 = "<div style='width: 345px; height: 341px;background-color:red;'>Position 1!</div>"
            when 2
              @Position2 = modulo.webpart.encoding
              @Dados = Content.find(modulo.module_key)
              @Position2.gsub!("[Title]",@Dados.name)
              @Position2.gsub!("[Description]", @Dados.summary)
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
              @Position8 = "aaaaaaaaaaaaa"
            when 9
              @Position9 = "bbbbbbbbbbb"
            when 10
              @Position10 = "cccccccccccccc"
            when 11
              @Position11 = modulo
            else
              puts "Fodeu"
          end
        end
    end
  end

end
