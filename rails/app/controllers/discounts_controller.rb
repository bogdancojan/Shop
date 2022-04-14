class DiscountsController < ApplicationController
  def update
    discount = Discount.where(code: discount_param[:code])

    if discount
      session[:discount] = discount[0].percentage
    end
  end

  private
  def discount_param
    params.require(:discount).permit(:code)
  end
end
