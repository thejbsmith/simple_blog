class CreateSimpleBlogPosts < ActiveRecord::Migration
  def change
    create_table :simple_blog_posts do |t|
      t.integer     :author_id
      t.references  :category
      t.string      :title
      t.string      :slug
      t.text        :content
      t.text        :excerpt
      t.datetime    :date
      t.boolean     :published
      t.integer     :featured_image_id
      t.string      :meta_keywords
      t.string      :meta_description

      t.timestamps
    end
  end
end
