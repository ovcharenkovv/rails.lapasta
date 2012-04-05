# -*- encoding : utf-8 -*-
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.boolean :published, :default => true
      t.string :name
      t.text :description

      t.integer :parent_id, :lft, :rgt, :depth, :position

      t.timestamps
    end
  end
end
