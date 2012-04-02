class ProductsController < InheritedResources::Base

  before_filter :get_category_or_author

  def get_category_or_author
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @categories = @category.children
      if @categories.count == 0
        @categories = @category
      end
    end
  end

  def index
      @products = Product.where(:category_id => @categories,:published => true)
  end

  def show
    @product = @category.products.where(:published => true).find(params[:id])
  end

  def new
    @product = @category.products.new
    3.times { @product.attachments.build }
  end

  def edit
    @product = @category.products.find(params[:id])
    3.times { @product.attachments.build }
  end

  def create
    @product = @category.products.new(params[:product])

    respond_to do |format|
      if @product.save
        #notify_us params[:action]
        format.html { redirect_to category_products_path }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to category_products_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
