class PagesController < InheritedResources::Base
  before_filter :get_category

  def get_category
    @page_category = PageCategory.where(:published=>true).find_by_slug!(params[:page_category_slug])
  end

  def index
    @pages = @page_category.pages.where(:published=>true).find(:all ,:order=>'created_at desc')
  end

  def show
    @page = @page_category.pages.where(:published=>true).find_by_slug!(params[:page_slug])
  end


end
