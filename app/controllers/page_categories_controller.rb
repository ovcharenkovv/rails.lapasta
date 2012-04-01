class PageCategoriesController < ApplicationController

  # GET /page_categories
  # GET /page_categories.json
  def index
    @page_categories = PageCategory.where(:published=>true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json=> @page_categories }
    end
  end
  #
  ## GET /page_categories/1
  ## GET /page_categories/1.json
  #def show
  #  @page_category = PageCategory.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @page_category }
  #  end
  #end

end
