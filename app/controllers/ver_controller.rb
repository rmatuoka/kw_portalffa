class VerController < ApplicationController
  layout "template2012" 
  before_filter :load_menu
  def index
    @mostrarshow = false
    category = 0
    subcategory = 0
    content = 0 
    category = params[:category].split("-") if !params[:category].blank?
    subcategory = params[:subcategory].split("-") if !params[:subcategory].blank?
    content = params[:content].split("-") if !params[:content].blank?   
     
    @conteudo = Content.all( :joins=> "inner join `subcategories` on `contents`.`subcategory_id` = `subcategories`.`id`
  		inner join `categories` on `subcategories`.`category_id` = `categories`.`id`",
                            :conditions=>[
                              '`contents`.`id` = ? and `subcategories`.`id` = ? and `categories`.`id` = ? 
                              and `contents`.`published` = "1" and `contents`.`active` = "1" 
                              and `subcategories`.`published` = "1" and `subcategories`.`active` = "1" 
                              and `categories`.`published` = "1" and `categories`.`active` = "1"',content[0], subcategory[0],category[0]
                                          ]      
                          )
                          
    if @conteudo.count > 0 
      #Se existe um conteudo que atende aos requisitos então carregue o show
      @mostrarshow = true
    else
      #Se não existe um conteudo que atende aos requisitos então verifique se a categoria existe
      @categoria = Category.all(:conditions =>['`categories`.`id` = ? and (`categories`.`published` = "1" and `categories`.`active` = "1")',category[0]])
      if @categoria.count > 0
        #Se a categoria existe então carregue os conteudos
        @conteudos = Content.all( :joins => 'inner join `subcategories` ON `contents`.`subcategory_id` = `subcategories`.`id`',
                                  :conditions => [
                                    '`subcategories`.`category_id` = ? AND (`contents`.`published` = "1" and `contents`.`active` = "1" 
                                    and `subcategories`.`published` = "1" and `subcategories`.`active` = "1")', @categoria.first.id],
                                  :order => '`contents`.`subcategory_id`'
                                )
      else
        #Se a categoria não existir então mande para a pagina inicial
        redirect_to root_path
      end
    end     
  end

end
