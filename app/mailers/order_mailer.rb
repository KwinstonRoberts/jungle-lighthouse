class OrderMailer < ActionMailer::Base
 default from: "noreply@jungle.com"

  def order_email(order)
   @order = order
   mail(to: 'kyle.w.r@hotmail.com', subject: @order.id)
 end
end
