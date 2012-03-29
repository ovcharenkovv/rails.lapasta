class PageCategory < ActiveRecord::Base
  has_many :pages
  validates :slug, :presence => true,
            :uniqueness => true
  validates :name, :presence => true
end
