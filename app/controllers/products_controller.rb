class ProductsController < InheritedResources::Base
  belongs_to :category
  #actions :index, :show
end

#class ProductsController < InheritedResources::Base
#
#  before_filter :get_category_or_author
#
#  def get_category_or_author
#    @category = Category.find(params[:category_id])
#  end
#
#  def index
#    @products = Product.where(:category_id => @category.id,:published => true)
#  end
#
#  def show
#    @product = @category.products.where(:published => true).find(params[:id])
#  end
#end
