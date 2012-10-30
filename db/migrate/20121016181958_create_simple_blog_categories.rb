class CreateSimpleBlogCategories < ActiveRecord::Migration
  def change
    create_table :simple_blog_categories do |t|
      t.string      :name
      t.string      :slug
      t.integer     :position

      t.timestamps
    end
  end
end
