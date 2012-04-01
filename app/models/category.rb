class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_protected :lft, :rgt
  attr_accessible :name,:published,:description, :parent_id, :position
end
