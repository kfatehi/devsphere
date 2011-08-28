class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      t.integer :parent_id
      t.timestamps
    end
  end
end
