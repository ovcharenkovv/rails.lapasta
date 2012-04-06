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
      t.string :shipment_id

      t.decimal :spent
      t.text :note

      t.timestamps
    end
  end
end

