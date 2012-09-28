class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, default: "YOLO"
      t.string :public_token, null: false
      t.date :released
      t.datetime :published

      t.timestamps
    end
    
    add_index :posts, :public_token, unique: true
  end
end
