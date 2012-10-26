class CreateSimpleBlogPosts < ActiveRecord::Migration
  def change
    create_table :simple_blog_posts do |t|
      t.references :category
      t.string :title
      t.string :slug
      t.string :featured_image
      t.text :content
      t.text :excerpt
      t.datetime :date
      t.boolean :published

      t.timestamps
    end
  end
end
