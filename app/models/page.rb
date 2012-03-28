class Page < ActiveRecord::Base
  belongs_to :page_category
  validates :slug, :presence => true,
            :uniqueness => true
end
