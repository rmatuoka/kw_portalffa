class Ingressos::RetornoController < ApplicationController
  layout "template2012" 
   before_filter :load_menu
  skip_before_filter :verify_authenticity_token
  
  def create
    return unless request.post?
      pagseguro_notification do |notification|
        if notification.valid?(:force)
          order = Order.find(notification.order_id)
          if order.pagseguro_id.blank?
            $first = true
          else
            $first = false
          end
          order.payment_type = notification.payment_method
          order.status = notification.status
          order.pagseguro_id = notification.transaction_id
          
          order.save
          
          if order.status.to_s.include? 'completed' or order.status.to_s.include? 'approved'
            if !order.completed
              UserMailer.payment_made(order).deliver
              UserMailer.order_completed(order).deliver
              order.completed = true
              order.save
            end
          else
            if $first
              UserMailer.transaction_initiated(order).deliver
              UserMailer.order_start(order).deliver
            end
          end
          
          #SETA QUOTES COMO INDIPONIVEL
          #carts = Cart.all(:conditions => ['session_id = ?', transaction.session_id])
          #carts.each do |c|
          #  q = Quote.find(c.quote_id)
          #  q.indisponivel = true
          #  #q.save
          #end   
          carts = order.user.carts.all(:conditions =>['completed = true'])  
          if carts.count > 0
            carts.each do |cart|
              cart.destroy
            end
          end                  
        end

      end  
      render :nothing => true

  end
  
  def index
    create_template(4)
  end
  
  def show
    
  end
end
