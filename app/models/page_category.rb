# -*- encoding : utf-8 -*-
class PageCategory < ActiveRecord::Base
  has_many :pages
  validates :slug, :uniqueness => true
  validates :name, :presence => true

  before_save :generate_slug


  def generate_slug
    self.slug = self.name.to_ascii.parameterize
  end

end
