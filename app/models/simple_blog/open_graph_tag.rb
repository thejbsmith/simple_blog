module SimpleBlog
  class OpenGraphTag < ActiveRecord::Base

    # Relations
    belongs_to :post

     # Attributes
    attr_accessible :name, :content
    
  end
end
