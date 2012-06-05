class UserMailer < ActionMailer::Base
  default :from => "FESTA DAS FLORES ATIBAIA<contato@festadasfloresdeatibaia.com.br>"
  
  def send_email_password_reset(user)
    @user = user
		mail(:to => user.email, :subject => "Instruções para trocar a senha")
	end
	
	#COMPRAS
	#Enviado quando ocorrer o primeiro retorno do pagseguro!
  def transaction_initiated(order)
    @order = order
    mail(:to => order.user.email, :bcc => "log@korewa.com.br", :subject => "Transação Iniciada")
  end
  
  #Enviado quando o pagamento for concuido!
  def payment_made(order)
    @order = order
    @order_itens = OrderTicket.all(:conditions => ['order_id = ?', @order.id])
    mail(:to => order.user.email, :bcc => "log@korewa.com.br", :subject => "Pedido Efetuado")
  end
  
  #Enviado quando o pedido entrar no sistema!
  def order_start(order)
    @order = order
    @order_itens = OrderTicket.all(:conditions => ['order_id = ?', @order.id])    
    mail(:to=>"compras@festadasfloresdeatibaia.com.br", :bcc => "log@korewa.com.br", :subject => @order.user.name + " - Novo Pedido através do Site")
  end
  
  #Enviado quando o pagamento for concluido!
  def order_completed(order)
    @order = order
    @order_itens = OrderTicket.all(:conditions => ['order_id = ?', @order.id])    
    mail(:to=>"compras@festadasfloresdeatibaia.com.br", :bcc => "log@korewa.com.br", :subject => @order.user.name + " - Pagamento Efetuado")    
  end
end
