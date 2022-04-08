class CartController < ApplicationController
  skip_before_action :verify_authenticity_token # delete this and resolve the error

  def update
    session[:cart] ||= {}
    session[:cart][cart_params[:barcode]] = cart_params[:quantity]
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
    session[:cart] = nil
  end

  private
    def cart_params
      params.require(:cart).permit(:barcode, :quantity)
    end
end
