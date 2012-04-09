# -*- encoding : utf-8 -*-
#class ProductsController < ApplicationController
class ProductsController < InheritedResources::Base
  belongs_to :category

  def index
    @products = Product.published_products(params)

  end

  def show
    @product = Product.published_product(params)

  end


end