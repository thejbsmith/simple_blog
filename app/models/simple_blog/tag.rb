module SimpleBlog
  class Tag < ActiveRecord::Base

    # Associations
    belongs_to :post

    # Attributes
    attr_accessible :name, :post_id

  end
end
