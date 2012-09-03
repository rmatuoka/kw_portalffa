class CartsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]

  def new
  end

  def create
    @cart = current_user.carts.build(params[:cart])
    if params[:cart][:amount].to_i > 0
      ticket = Ticket.find(params[:cart][:ticket_id])
      if ((ticket.above > 0) and (ticket.above < params[:cart][:amount].to_i))
        @cart.price = (ticket.price - ticket.ticket_type.discount - ticket.discount)
      else
        @cart.price = (ticket.price - ticket.ticket_type.discount)
      end
      if !@cart.save 
        @erro = true
      end
    else
      @erro = true
    end
  end


  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to ingressos_confira_index_path, :notice => "Successfully destroyed cart."
  end
  
  def destroy_cart
    @carts = current_user.carts.all
    if @carts.count > 0
      @carts.each do |c|
        c.destroy
      end
      flash[:destroy_cart] = true
      redirect_to ingressos_selecione_index_path 
    end
  end
end
