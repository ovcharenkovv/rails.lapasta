# -*- encoding : utf-8 -*-
class OrdersController < InheritedResources::Base
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, :notice => "Your cart is empty"
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @order }
    end
  end
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        Notifier.order_created(@order).deliver


        format.html { redirect_to('/content/happy', :notice => 'Пасибки за заказ') }
        format.xml { render :xml => @order, :status => :created,
                            :location => @order }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @order.errors,
                            :status => :unprocessable_entity }
      end
    end
  end

end
