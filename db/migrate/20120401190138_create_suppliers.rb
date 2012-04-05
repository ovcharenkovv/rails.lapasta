# -*- encoding : utf-8 -*-
class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :full_name
      t.string :phone
      t.string :address
      t.string :email
      t.string :cnn
      t.text :note

      t.timestamps
    end
  end
end
