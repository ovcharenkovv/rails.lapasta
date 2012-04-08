# -*- encoding : utf-8 -*-
class Notifier < ActionMailer::Base
  default :from => 'LaPasta <no-reply@lapasta.com.ua>',
          :reply_to => 'lapastaua@gmail.com'

  def order_created(order)
    @order = order
    mail :to => 'lapastaua@gmail.ru',:cc=>['test@mail.ru','ovcharenkovv@gmail.com'], :subject => 'Заказ на LaPasta'
  end

end
