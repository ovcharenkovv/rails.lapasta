class CreatePageCategories < ActiveRecord::Migration
  def change
    create_table :page_categories do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.boolean :published
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end
