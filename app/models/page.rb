# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
  belongs_to :page_category
  validates :slug, :uniqueness => true
  validates :title, :page_category_id, :presence => true

  before_save :generate_slug


  def generate_slug
    self.slug = self.title.to_ascii.parameterize
  end

end
