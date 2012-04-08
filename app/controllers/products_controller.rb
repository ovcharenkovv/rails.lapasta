# -*- encoding : utf-8 -*-
class ProductsController < InheritedResources::Base
  belongs_to :category
    before_filter :get_category

  def get_category
    @category = Category.find(params[:category_id])
  end

  def index
    @products = @category.products.includes(:category).includes(:attachments).where(:published => true)
  end

  def show
    @product = @category.products.includes(:attachments).where(:published => true).find(params[:id])
  end


end