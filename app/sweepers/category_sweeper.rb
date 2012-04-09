# -*- encoding : utf-8 -*-
class CategorySweeper < ActionController::Caching::Sweeper
  observe Category

  def after_create (category)
    expire_cache_for
  end

  def after_update(category)
    expire_cache_for
  end

  def after_destroy(category)
    expire_cache_for
  end

  private

  def expire_cache_for
    expire_fragment('menu')
  end

end