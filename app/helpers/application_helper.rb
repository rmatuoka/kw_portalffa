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
      @Url = "/#{@Dados.subcategory.category.url_slug}/#{@Dados.subcategory.url_slug}/#{@Dados.url_slug}"
      @Encoding = @Encoding.gsub("[goto]", @Url)
      @Encoding = @Encoding.gsub("[category]", @Dados.subcategory.category.name)
      @Encoding = @Encoding.gsub("[setcolor]", @Dados.subcategory.category.color)      
      @Encoding = @Encoding.gsub("[title]",@Dados.name)
      @Encoding = @Encoding.gsub("[description]", @Dados.summary)      
      return raw(@Encoding)
      
    when 2
      #----------CURTOM HTML
      puts "RENDER CUSTOM HTML"
      return raw(modulo.module_key)
      
    when 3
      #----------IMAGEM
      puts "RENDER IMAGEM"
      @Dados = Upload.find(modulo.module_key)
      return image_tag @Dados.file.url
    when 6
      #----------BANNER
      puts "RENDER BANNER"
      @Dados = Banner.find(modulo.module_key)
      return link_to(image_tag(@Dados.file.url), banner_path(@Dados), :target => @Dados.link_target)
    when 8
      #----------CLIMA TEMPO
      puts "RENDER CLIMA TEMPO"    
      return raw(@Webpart.encoding)
      
    when 5
      #----------NEWSLETTER
      puts "RENDER NEWSLETTER"
      
      return raw(@Webpart.encoding)
    
    when 4
      #----------GALERIA
      puts "RENDER GALERIA"
      
      @Galeria = Gallery.find(modulo.module_key)
      @GaleriaImagens = @Galeria.gallery_images.all
      counter = 1
      
      retorno = ""
      retorno += "<h1 class='Title_gal_red'>Galeria<span class='Img_h1_gal_1'></span></h1>"           
      retorno +=                "<div id='Gallery_home_box'>	<!--start Gallery_home_box-->"
      retorno +=                    "<div id='slideshow-main'>"
      retorno +=                        "<ul>"
      @GaleriaImagens.each do |image|
        #-----INICIO LOOP 1
        if counter == 1
          retorno +=                            "<li class='p#{counter} active'>"
        else
          retorno +=                            "<li class='p#{counter}'>"
        end
        retorno +=                                "<a href='#'>"
        #retorno +=                                    "<img src='images/1_big.gif' width='476' height='312' alt=''/>"
        retorno +=                                    image_tag image.upload.file.url(:gallery)
        retorno +=                                    "<span class='opacity'></span>"
        retorno +=                                    "<span class='content'><h1></h1><p></p></span>"
        retorno +=                                "</a>"
        retorno +=                            "</li>"
        #-----FIM LOOP 1
        counter = counter + 1
      end
      counter = 1
      
      retorno +=                        "</ul>"										
      retorno +=                    "</div> "                               
      retorno +=                    "<div id='slideshow-carousel'>		"		
      retorno +=                          "<ul id='carousel' class='jcarousel jcarousel-skin-tango'>"
      @GaleriaImagens.each do |image|
        #-----INICIO LOOP 2
        retorno +=                            "<li><a href='#' rel='p#{counter}'>#{image_tag image.upload.file.url(:gallery_thumb)}</a></li>"
        #-----FIM LOOP 2
        counter = counter + 1
      end
      retorno +=                          "</ul>"
      retorno +=                    "</div>     "       
      retorno +=                   " <div class='clear'></div>"
      retorno +=               "</div> <!--End Gallery_home_box-->"
      
      return raw(retorno)
    else
      puts "Fodeu"
    end
    
    
  end
  #------------------------------------------------------------------------------ HELPERS WEBPARTS
end
