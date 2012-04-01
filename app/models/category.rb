class Category < ActiveRecord::Base
  has_many :products
  acts_as_nested_set
  attr_protected :lft, :rgt
  attr_accessible :name,:published,:description, :parent_id, :position
end
