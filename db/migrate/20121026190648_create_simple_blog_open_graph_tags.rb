class CreateSimpleBlogOpenGraphTags < ActiveRecord::Migration
  def change
    create_table :simple_blog_open_graph_tags do |t|
      t.references   :post
      t.string       :name
      t.string       :content

      t.timestamps
    end

    add_index :simple_blog_open_graph_tags, :post_id
  end
end
