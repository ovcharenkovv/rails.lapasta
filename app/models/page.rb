class Page < ActiveRecord::Base
  belongs_to :page_category
  validates :slug, :presence => true,
            :uniqueness => true
  validates :page_category_id, :presence => true
end
