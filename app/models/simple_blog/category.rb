module SimpleBlog
  class Category < ActiveRecord::Base

    # Relations
    has_many :posts

    # Attributes
    attr_accessible :name, :position, :slug

    # Validations
    validates :name, presence: true, uniqueness: true
    validates :slug, uniqueness: true

    # Scopes

    # Callbacks
    set_callback(:save, :before) do |category|
      category.slug = category.name.parameterize if category.slug.nil? or category.slug.empty?
    end

  end
end
