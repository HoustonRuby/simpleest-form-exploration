class CreatePostCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :post_category_memberships do |t|
      t.references :post
      t.references :category

      t.timestamps
    end
    add_index :post_category_memberships, :post_id
    add_index :post_category_memberships, :category_id
  end
end
