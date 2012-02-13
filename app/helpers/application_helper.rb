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
end
