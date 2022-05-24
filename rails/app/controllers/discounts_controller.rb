class DiscountsController < ApplicationController
  def update
    discount = Discount.find_by_code(discount_param[:code])

    if discount
      session[:discount] = discount.percentage
    else
      flash[:alert] = 'The discount code is incorrect !'
    end
  end

  private
  def discount_param
    params.require(:discount).permit(:code)
  end
end
