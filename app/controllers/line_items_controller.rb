# -*- encoding : utf-8 -*-
class LineItemsController < InheritedResources::Base

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart) }
        format.xml { render :xml => @line_item,
                            :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @line_item.errors,
                            :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(@line_item.cart) }
      format.xml  { head :ok }
    end
  end


end
