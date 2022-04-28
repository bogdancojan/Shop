class CartController < ApplicationController
  def update
    session[:cart] ||= {}
    session[:cart][cart_params[:barcode]] = cart_params[:quantity].to_i
  end

  def show
    if session[:cart]
      if session[:discount]
        @discount = session[:discount]
        
        session.delete(:discount)
      end

      @cart ||= {}
      session[:cart].each do |barcode, quantity|
        pair = {}
        product = Product.find_by_barcode(barcode)
        pair[product] = quantity
        @cart.merge!(Hash[pair])
      end

      return @cart
    end
  end

  def destroy
    session[:cart] = {}
  end

  def delete_product
    session[:cart].delete(cart_params[:barcode])
  end

  def sub_quantity
    if session[:cart][cart_params[:barcode]] > 1 
      session[:cart][cart_params[:barcode]] -= 1
    end
  end

  def add_quantity
    if session[:cart][cart_params[:barcode]] < 5
      session[:cart][cart_params[:barcode]] += 1
    end
  end

  private
    def cart_params
      params.require(:cart).permit(:barcode, :quantity)
    end
end
