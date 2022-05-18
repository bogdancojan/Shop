class Apis::Products::V1::ProductsController < ApplicationController
  def index
    @products = []
    Product.all.each do |product|
      @products << get_formated_product(product)
    end
    render json: @products
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    if @product.destroyed?
      head 200
    end
  end

  private
  def get_formated_product(product)
    formatted_product = {
      id: product.id,
      name: product.name,
      price: product.price,
      barcode: product.barcode,
      photo_url: product.photo_url
    }
  end
end
