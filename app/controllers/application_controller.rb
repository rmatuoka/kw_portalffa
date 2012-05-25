class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  helper_method :current_user
  
  def navegadorie6
    if browser.ie6?
      redirect_to atualizar_index_path
    end 
  end
  
  def load_menu
    @Categorias_menu = Category.all_published_menu
    @Complementos_menu = ComplementMenu.all_published
    @Footer_site = FooterSite.all_published_order
  end

  def create_template(t_type)
    #    ============== Inicio do Template ===============	  
        @Template = ::Template.find(:all,:conditions => ["`templates`.`template_type` = ? and `templates`.`published` = 1 and `templates`.`active` = 1", t_type], :limit=> 1)
        if @Template.count > 0
          @WebModules = @Template.first.webmodules.all_published
          @WebModules.each do |modulo|
            case modulo.position 
            when 1
              @Position1 = modulo
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
            when 16
              @Position16 = modulo
            when 17
              @Position17 = modulo
            when 18
              @Position18 = modulo                             
            else
              puts "Fodeu"
            end
          end
        end		  
    #    ============== Final do Template ===============
  end
     
  private
  
  def current_user_session
   return @current_user_session if defined?(@current_user_session)
   @current_user_session = UserSession.find
   end

   def current_user
   return @current_user if defined?(@current_user)
   @current_user = current_user_session && current_user_session.record
   end
   
   rescue_from 'Acl9::AccessDenied', :with => :access_denied
   
   def access_denied
     if current_user
       flash[:temerro] = " "
       flash[:error] = 'Você não tem permissão para acessar está página!'
       redirect_to login_path       
     else
       flash[:temerro] = " "
       flash[:error] = 'Acesso negado. Você precisa estar logado.'
       redirect_to login_path
     end
   end
end
