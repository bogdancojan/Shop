require 'securerandom'

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.barcode = SecureRandom.alphanumeric(6)

    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :photo_url)
    end
end
