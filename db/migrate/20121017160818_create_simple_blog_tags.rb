class CreateSimpleBlogTags < ActiveRecord::Migration
  def change
    create_table :simple_blog_tags do |t|
      t.references   :post
      t.string       :name

      t.timestamps
    end
  end
end
