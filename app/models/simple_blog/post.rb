module SimpleBlog
  class Post < ActiveRecord::Base

    # Relations
    belongs_to  :category
    has_many    :comments
    has_many    :tags

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




    # Class methods
    def self.published_in_category(category_slug)
      category = Category.find_by_slug(category_slug)
      category.posts.published
    end

    def self.published_in(month, year)
      begin
        start_date = Date.new(year, month, 1)
        end_date   = start_date + 1.month
      rescue
        self.published
      end
      self.published.where(:date => start_date..end_date)
    end

    def self.tagged_with(tag)
      Post.joins(:tags).where("#{Tag.table_name}.name = ?", tag)
    end

  end
end
