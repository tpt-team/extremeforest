class OrderMailer < ActionMailer::Base
  default from: 'support_extremeforest@gmail.com'
  def new_order(id)
    @id = id
    mail(to: 'extremeforest@gmail.com', subject: 'New order')
  end
end
