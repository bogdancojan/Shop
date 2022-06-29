class Apis::Cart::V1::DiscountsController < ApplicationController
  def update
    discount = Discount.find_by_code(discount_param[:code])

    obj_returned = {}
    if discount
      obj_returned = get_formated_discount(discount)
    end

    render json: obj_returned
  end

  private
  def discount_param
    params.require(:discount).permit(:code)
  end

  def get_formated_discount(discount)
    formatted_discount = {
      percentage: discount.percentage
    }
  end
end
