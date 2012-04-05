# -*- encoding : utf-8 -*-
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :pay_type
      t.string :delivery_type
      t.decimal :spent
      t.text :note
      t.integer :order_id

      t.timestamps
    end
    add_index :orders, :order_id
  end
end
