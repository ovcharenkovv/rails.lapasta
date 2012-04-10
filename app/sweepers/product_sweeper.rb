# -*- encoding : utf-8 -*-
class ProductSweeper < ActionController::Caching::Sweeper
  observe Product

  def after_create(product)
    expire_cache_for(product)
  end

  def after_update(product)
    expire_cache_for(product)
  end

  def after_destroy(product)
    expire_cache_for(product)
  end

  private

  def expire_cache_for(product)
    expire_fragment("homepage")
    expire_fragment("products_of_category_#{product.category.id}}")
    expire_fragment("product_#{product.id}")
    expire_fragment("bestsellers_#{product.category.id}")
    expire_fragment("related_#{product.id}")


    #if previous_product = Product.previous_product(product.id,product.category_id)
    #  expire_fragment("product_#{previous_product.category.id}_#{previous_product.id}")
    #end
    #
    #if next_product = Product.next_product(product.id,product.category_id)
    #  expire_fragment("product_#{next_product.category.id}_#{next_product.id}")
    #end
  end


end