# -*- encoding : utf-8 -*-
class CreatePageCategories < ActiveRecord::Migration
  def change
    create_table :page_categories do |t|
      t.boolean :published, :default => true
      t.string :name
      t.string :slug
      t.text :description
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.timestamps
    end
  end
end
