class CreateSimpleBlogComments < ActiveRecord::Migration
  def change
    create_table :simple_blog_comments do |t|
      t.integer     :commenter_id
      t.references  :post
      t.text        :text
      t.integer     :parent_id

      t.timestamps
    end

    add_index :simple_blog_comments, :commenter_id
    add_index :simple_blog_comments, :post_id
    add_index :simple_blog_comments, :parent_id
  end
end
