class CreateSimpleBlogTags < ActiveRecord::Migration
  def change
    create_table :simple_blog_tags do |t|
      t.references   :post
      t.string       :name
      t.integer      :parent_id

      t.timestamps
    end

    add_index :simple_blog_tags, :post_id
  end
end
