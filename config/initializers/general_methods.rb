class ActiveRecord::Base
  #Metodo que substitui o destroy
  def newdestroy
    self.active = false
    self.save
  end
    
  private 
  # Metodo para listar somente os ativos (Não "Deletados")
  def self.all_active
    all(:conditions => ['active =  true'])
  end
  
  # Metodo para listar todos publicados
  def self.all_published
    all(:conditions => ['active =  true and published = true'])
  end  
  def self.all_published_menu
    all(:conditions => ['active =  true and published = true and menu_display = true'])
  end

end