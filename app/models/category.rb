class Category < ActiveRecord::Base
  has_many :products
  acts_as_nested_set
  attr_protected :lft, :rgt
  attr_accessible :name,:published,:description, :parent_id, :position

  def self.main_menu
    self.where(:published=>true).order(:position).roots
  end
end
