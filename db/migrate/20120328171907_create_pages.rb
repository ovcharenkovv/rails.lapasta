class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.boolean :published, :default => true
      t.string :title
      t.string :slug
      t.text :short_body
      t.text :body
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.integer :page_category_id
      t.timestamps
    end
    add_index :pages, :page_category_id
  end
end
