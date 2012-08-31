class Admin::SearchsController < ApplicationController
  access_control do
      allow :admin, :all
      allow :supervisor, :all
  end
  
  layout "inadmin"

  def index
    fstatus = ' '
    ftype = ' '
    if !params[:status].blank?
      if (ApplicationController.helpers.traduz_status_do_pedido(params[:status]) != '')
        fstatus = " and status = '"+ params[:status]+"'" 
      end
    end
    if !params[:type].blank?
      if (ApplicationController.helpers.traduz_tipo_do_pagamento(params[:type]) != '')
        ftype = " and payment_type = '"+ params[:type]+"'" 
      end
    end    
    
    @Orders = Order.find( :all,
                          :conditions => ['id > 0'+fstatus+ftype],
                          :order => 'id DESC',
                          :include =>[:user]
                        ).paginate :page => params[:page],:per_page => 50 
  end

  def show
    fstatus = ' '
    ftype = ' '
    if !params[:status].blank?
      if (ApplicationController.helpers.traduz_status_do_pedido(params[:status]) != '')
        fstatus = " and status = '"+ params[:status]+"'" 
      end
    end
    if !params[:type].blank?
      if (ApplicationController.helpers.traduz_tipo_do_pagamento(params[:type]) != '')
        ftype = " and payment_type = '"+ params[:type]+"'" 
      end
    end    
    
    @Orders = Order.find( :all,
                          :conditions => ['user_id = ?'+fstatus+ftype, params[:id]],
                          :order => 'id DESC',
                          :include =>[:user]
                        ).paginate :page => params[:page],:per_page => 50    
  end
    
  def results
    if !params[:keyword].blank?
      if params[:keyword].length < 10
        puts ">>>>>>ID"
        @Results = Order.find_by_id(params[:keyword])
      else
        puts ">>>>>>PAGSEGURO ID"
        @Results = Order.find_by_pagseguro_id(params[:keyword])
      end
      
      #@Results = Order.search_for(params[:keyword])
      if !@Results.blank?
        @Results_itens = @Results.order_tickets
      else
                
        redirect_to search_admin_searchs_path(params[:keyword])
        
      end
    end
  end
  
  
  def search
    pesquisa = params[:format]
    pesquisa = pesquisa.gsub(".","")
    pesquisa = pesquisa.gsub("-","")
    
    @Orders = Order.find( :all,
                          :select => "`orders`.* ,`users`.`name`",
                          :joins => "INNER JOIN `users` ON `orders`.`user_id` = `users`.`id`",
                          :conditions => ['(trim(replace(replace(`users`.`cpf`, ".", ""), "-", "")) = ?) 
                        	OR
                        	(trim(replace(replace(`users`.`rg`, ".", ""), "-", "")) = ?)
                        	OR
                        	(`users`.`name` LIKE "%'+pesquisa+'%")
                        	OR
                        	(trim(replace(replace(`users`.`email`, ".", ""), "-", "")) = ?)', pesquisa,pesquisa,pesquisa],
                          :order => 'id DESC'
                        ).paginate :page => params[:page],:per_page => 50
  end
  
  def baixa
    @Baixa = OrderTicket.find(params[:id])
    @Baixa.reduction = true
    @Baixa.save
    redirect_to request.env['HTTP_REFERER']
  end
  
  def resend
    if !params[:cod].blank?
      $Order = Order.all(:conditions=>['id = ? and ((status = "completed") or (status = "approved"))',params[:cod]])
      if $Order.count == 0
        flash[:notice] = "Dados informados são invalidos"
      else
        UserMailer.payment_made($Order.first).deliver
        flash[:notice] = "Email Enviado com sucesso!"
      end
    else
      flash[:notice] = "Erro ao processar os dados, ID não informada!"
    end
  end
end
