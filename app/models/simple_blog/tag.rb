module SimpleBlog
  class Tag < ActiveRecord::Base

    # Relations
    belongs_to :post

    # Attributes
    attr_accessible :name

  end
end
