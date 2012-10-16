module SimpleBlog
  class Comment < ActiveRecord::Base

    # Relations
    belongs_to :post
    
    # Attributes
    attr_accessible :post_id, :text
    
  end
end
