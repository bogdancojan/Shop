class OrdersController < ApplicationController
  def create
    if user_signed_in?
      order = Order.new(order_params)
      order.user_id = current_user.id

      if order.save
        flash[:notice] = 'Your order has been placed ! Check your email for the receipt !'
        flash.keep(:notice)
        session[:cart] = {}
        head 201
      end
    else
      flash[:alert] = 'You need an account first !'
      flash.keep(:alert)
      head 200
    end
  end 
  
  private
  def order_params
    params.require(:order).permit!
  end
end
