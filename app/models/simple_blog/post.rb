module SimpleBlog
  class Post < ActiveRecord::Base

    # Relations
    belongs_to  :category
    has_many    :comments

    # Attributes
    attr_accessible :content, :date, :excerpt, :published, :slug, :tags, :title, :category_id

    # Validations
    validates :title, presence: true, uniqueness: true
    validates :slug, uniqueness: true

    # Scopes
    scope :published, :conditions => { :published => true }, :order => 'date DESC'

    # Callbacks
    set_callback(:save, :before) do |post|
      post.slug = post.title.parameterize if post.slug.nil? or post.slug.empty?
    end

  end
end
