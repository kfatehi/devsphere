class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :post_id
      t.integer :user_id
      t.timestamps
    end
  end
end
