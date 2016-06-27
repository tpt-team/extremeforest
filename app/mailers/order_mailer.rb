class OrderMailer < ActionMailer::Base
  default from: 'Extrfor@gmail.com'
  def new_order(id)
    @id = id
    mail(to: 'Extrfor@gmail.com', subject: 'New order')
  end
end
