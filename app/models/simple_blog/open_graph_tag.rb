module SimpleBlog
  class OpenGraphTag < ActiveRecord::Base

    # Associations
    belongs_to :post

     # Attributes
    attr_accessible :name, :content
    
  end
end
