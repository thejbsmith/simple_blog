module SimpleBlog
  class Post < ActiveRecord::Base

    # Relations
    belongs_to  :category
    has_many    :comments
    has_many    :tags

    accepts_nested_attributes_for :tags, :allow_destroy => true

    # Attributes
    attr_accessible :featured_image, :content, :date, :excerpt, :published, :slug, :tags, :title, :category_id, :tags_attributes

    # Validations
    validates :title, presence: true, uniqueness: true
    validates :slug, uniqueness: true

    # Scopes
    scope :published, :conditions => { :published => true }, :order => 'date DESC'

    # Callbacks
    set_callback(:save, :before) do |post|
      post.slug = post.title.parameterize if post.slug.nil? or post.slug.empty?
      
      # Create excerpt based on content. Will use the first paragraph tag and remove all image tags from it if the excerpt field is left blank
      post.excerpt = HTML::Document.new(post.content).find(:tag => 'p').to_s.gsub(/<img .*?>/i, '') if post.excerpt.nil? or post.excerpt.empty?
    end

    set_callback(:initialize, :after) do |post|
      post.date ||= Time.now
    end

    # Class methods
    def self.published_in_category(category)
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
      # TODO: Decide if we want to match tags based on capitalization or not
      #       Right now this only matches EXACTLY. Word != word
      self.joins(:tags).where("#{Tag.table_name}.name = ?", tag)
    end

    def self.search(query)
      table = self.arel_table
      self.where(table[:title].matches("%#{query}%").or(table[:content].matches("%#{query}%"))).published
    end

  end
end
