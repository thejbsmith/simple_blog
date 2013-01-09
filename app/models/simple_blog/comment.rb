module SimpleBlog
  class Comment < ActiveRecord::Base

    # Associations
    belongs_to  :commenter, :class_name => SimpleBlog.commenter_user_class
    belongs_to  :post
    
    # Attributes
    attr_accessible :post_id, :text, :commenter_id
    
  end
end
