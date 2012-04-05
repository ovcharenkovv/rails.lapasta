class CartsController < InheritedResources::Base
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, :notice => 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @cart }
      end
    end
  end

  def destroy
    @cart = current_cart
    @cart.line_items.destroy_all
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => 'Your cart is currently empty') }
    end
  end




end