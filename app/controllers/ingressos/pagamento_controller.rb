class Ingressos::PagamentoController < ApplicationController
  access_control do
      allow logged_in, :all
  end
  layout "template2012" 
  before_filter :load_menu
  
  def index
    @carts = current_user.carts.all
    
    @total_final = 0
    
    @order = Order.new
    #GRAVAR TRANSACAO NO BANCO , OS ITENS COMPRADOS ESTAO GRAVADOS NO CARRINHO
    #VERIFICA SE EXISTE A TRANSACAO
    @order.user_id = current_user.id
    @order.status = "incompleted"
    
    if !@order.save
      #erro
      flash[:notice] = "Erro ao gravar transação"
    else
      #GERAR PEDIDO
      @order_product = PagSeguro::Order.new(@order.id)
      
      #PEGA ITENS DO CARRINHO E ADICIONA AO PEDIDO E FINALIZA
      @carts = current_user.carts.all(:joins => 'INNER JOIN `tickets` ON `carts`.`ticket_id` = `tickets`.`id`',
                                      :order => '`tickets`.`ticket_category_id`, `tickets`.`ticket_date`')
      
      if !@carts.blank?
        @carts.each do |cart_item|
          @pedidos = @order.order_tickets.build
          @pedidos.ticket_id = cart_item.ticket_id
          @pedidos.amount = cart_item.amount
          @pedidos.price = cart_item.price
          @pedidos.save
          
          @order_product.billing = {
            :name                  => current_user.name,
            :email                 => current_user.email
          }
          @order_product.add :id => cart_item.ticket_id, :quantity => cart_item.amount, :price => cart_item.price, :description => cart_item.ticket.name
          if !(cart_item.completed)
            cart_item.completed = true
            cart_item.save
          end
        end
      end
    end
  
    #LIMPA CARRINHO
    create_template(4)
  end  
end
