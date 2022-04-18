require 'securerandom'

class ProductsController < ApplicationController
  before_action :check_admin, only: [:new]

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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :photo_url)
    end

    def check_admin
      unless current_user && current_user.admin
        redirect_to root_path, alert: "You don't have permission to add a new product !" 
      end
    end
end
