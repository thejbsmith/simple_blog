class CreateSimpleBlogComments < ActiveRecord::Migration
  def change
    create_table :simple_blog_comments do |t|
      t.integer     :commenter_id
      t.references  :post
      t.text        :text

      t.timestamps
    end
  end
end
