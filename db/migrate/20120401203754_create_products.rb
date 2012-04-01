class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :published, :default => true
      t.string :title
      t.decimal :price
      t.decimal :supplier_price
      t.integer :supplier_id
      t.integer :category_id
      t.string :status
      t.text :description

      t.timestamps
    end
    add_index :products, :supplier_id
    add_index :products, :category_id
  end
end
