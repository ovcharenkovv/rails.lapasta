# -*- encoding : utf-8 -*-
class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity, :default => 1

      t.timestamps
    end
    add_index :line_items, :product_id
    add_index :line_items, :cart_id
  end
end
