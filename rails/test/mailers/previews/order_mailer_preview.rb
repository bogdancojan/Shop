# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_placed_email
    OrderMailer.with(order: Order.last).order_placed_email
  end
end
