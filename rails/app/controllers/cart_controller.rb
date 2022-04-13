class CartController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    session[:cart] ||= {}
    session[:cart][cart_params[:barcode]] = cart_params[:quantity].to_i
  end

  def show
    if session[:cart]
      @cart ||= {}
      session[:cart].each do |barcode, quantity|
        pair = []
        product = Product.where(barcode: barcode)
        pair.append([product, quantity])
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
