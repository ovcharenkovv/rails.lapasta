# -*- encoding : utf-8 -*-
module ApplicationHelper
  def breadcrumb(param)
    separator = ' » '
    ret = link_to 'Главна','/'

    case param[:controller]
      when 'pages'
        ret += separator
        ret += link_to PageCategory.find_by_slug(param[:page_category_slug]).name, short_category_page_url(param[:page_category_slug])
        if param[:action]=='show'
          ret += separator
          ret += link_to Page.find_by_slug(param[:page_slug]).title
        end
      when 'products'
        ret += separator
        ret += link_to Category.find(param[:category_id]).name, category_products_url(param[:category_id])
        if param[:action]=='show'
          ret += separator
          ret += link_to Product.find(param[:id]).title
        end
      when 'carts'
        ret += separator
        ret += link_to "Корзина", cart_url(param[:cart_id])
      else
    end
    ret
  end
end
