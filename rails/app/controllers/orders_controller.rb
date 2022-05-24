require 'securerandom'

class OrdersController < ApplicationController
  before_action :check_user, only: [:index, :show]

  def index
    orders_for = User.find_by_id(current_user.id)
    @orders = orders_for.orders
  end
  
  def show
    @order = Order.find(params[:id])

    @order_products = {}
    @order.products.each do |barcode, quantity|
      product = Product.find_by_barcode(barcode)
      
      @order_products[product] = quantity
    end
  end

  def create
    if user_signed_in?
      order = Order.new(order_params)
      order.user_id = current_user.id
      order.guid = SecureRandom.uuid

      if order.save
        OrderMailer.with(order: order).order_placed_email.deliver_later

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

  def check_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need an account to check your orders !" 
    end
  end
end
