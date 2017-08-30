class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"

  def thanks_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thanks for ordering!') do |format|
      format.text { render plain: 'Thanks for ordering' }
    end
  end
end
