# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Перевод на карту Приватбанка","Наложеный платеж" ]
  DELIVERY_TYPES = ["Новая почта - 23 грн.","Укрпочта - 23 грн." ]
  DELIVERY_PRICE = 23
  ORDER_STATUS = ["новый", "ожидает проплаты" , "оплачено","отправлено","успех","возврат","закрыт"]

  validates :name,:phone, :presence => true

  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
            :presence => true

  has_many :line_items,:dependent => :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end



end
