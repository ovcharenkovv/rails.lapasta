class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :product_id
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.timestamps
    end
    add_index :attachments, :product_id
  end
end
