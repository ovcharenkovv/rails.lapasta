# -*- encoding : utf-8 -*-
class PageCategoriesController < InheritedResources::Base
  def index
    @page_categories = PageCategory.where(:published=>true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json=> @page_categories }
    end
  end

  #def show
  #  @page_category = PageCategory.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @page_category }
  #  end
  #end

end
