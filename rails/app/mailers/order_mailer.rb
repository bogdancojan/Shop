class OrderMailer < ApplicationMailer
  def order_placed_email
    @order = params[:order]

    mail(to: @order.user.email, subject: 'Your order #' + @order.id.to_s + ' has been placed')
  end
end
