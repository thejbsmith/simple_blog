module SimpleBlog
  class Comment < ActiveRecord::Base

    # Associations
    belongs_to  :commenter, :class_name => SimpleBlog.commenter_user_class
    belongs_to  :post
    
    # Attributes
    attr_accessible :post_id, :text, :commenter_id, :parent_id
    # Add parent association. Also, touch parent every time a child is updated
    belongs_to :parent, :class_name => 'Comment', :touch => true
    # Add children association. Also, delete all children when the parent is deleted
    has_many :children, :foreign_key => 'parent_id', :class_name => 'Comment', :dependent => :delete_all

    # Scopes
    scope :top_level, where(:parent_id => nil)
    
  end
end
