module ApplicationHelper
  def print_active(status)  
    retorno = ""
    if status
      retorno = "Sim"
    else
      retorno = "Não"
    end
    return retorno
  end
  
  def func_sex(status)
      retorno = ""
      if status
        retorno = "Masculino"
      else
        retorno = "Feminino"
      end
      return retorno
  end
  
  #Metodo que exibe o nome do Model, se true vai mostrar o nome no plural obtendo a informação do locales/xx.yml  
  def show_model_name(modelshow, plural = false)
    if (plural)
      return modelshow.model_name.human(:count => 2)
    else
      return modelshow.model_name.human
    end
    puts "Foi"
  end
  
  def traduz_template(type_template)
    case type_template
      when 1 then return t('activerecord.attributes.template.types.one')
      when 2 then return t('activerecord.attributes.template.types.two')
      when 3 then return t('activerecord.attributes.template.types.three')
    end
  end
  
  
  #------------------------------------------------------------------------------ HELPERS WEBPARTS
  def render_webpart(modulo)
    @Webpart = modulo.webpart
    puts "RENDER WEBPART"
    puts @Webpart.webtype
    #------------------VERIFICA O TIPO DO WEBPART
    case @Webpart.webtype.to_i
    when 1
      #----------NOTICIAS
      puts "RENDER NOTICIA"
      @Encoding = @Webpart.encoding
      @Dados = Content.find(modulo.module_key)
      
      @Encoding = @Encoding.gsub("[Title]",@Dados.name)
      @Encoding = @Encoding.gsub("[Description]", @Dados.summary)
      
      return raw(@Encoding)
      
    when 2
      #----------CURTOM HTML
      puts "RENDER CUSTOM HTML"
      return raw(modulo.module_key)
    else
      puts "Fodeu"
    end
    
    
  end
  #------------------------------------------------------------------------------ HELPERS WEBPARTS
end
