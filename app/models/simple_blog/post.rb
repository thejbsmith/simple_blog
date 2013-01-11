module SimpleBlog
  class Post < ActiveRecord::Base

    # Pagination
    paginates_per 10

    # Associations
    belongs_to  :author, :class_name => SimpleBlog.author_user_class
    belongs_to  :category
    has_many    :comments
    has_many    :tags
    has_many    :open_graph_tags

    accepts_nested_attributes_for :tags, :allow_destroy => true
    accepts_nested_attributes_for :open_graph_tags, :allow_destroy => true

    # Attributes
    attr_accessible :content, :date, :excerpt, :published, :slug, :tags, :title, :category_id, :tags_attributes, :open_graph_tags_attributes, :meta_keywords, :meta_description, :author_id, :featured_image_id

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
      post.date ||= Time.now.utc
    end

    def related_posts(count = 3)
      related_posts = []
      self.tags.each do |tag|
        related_posts += Post.tagged_with(tag.name)
      end
      related_posts.uniq.shuffle[1..count]
    end

    def featured_image
      Rich::RichFile.find(self.featured_image_id).rich_file if self.featured_image_id
    end

    # Class methods
    def self.published_in(month, year)
      begin
        start_date = Date.new(year, month, 1)
        end_date   = start_date + 1.month
      rescue
        self.includes([:author, :tags]).published
      end
      self.where(:date => start_date..end_date).includes([:author, :tags]).published
    end

    def self.tagged_with(tag)
      # TODO: Decide if we want to match tags based on capitalization or not
      #       Right now this only matches EXACTLY. Word != word
      self.includes([:author, :tags]).joins(:tags).where("#{Tag.table_name}.name = ?", tag).published
    end

    def self.search(query)
      table = self.arel_table
      self.where(table[:title].matches("%#{query}%").or(table[:content].matches("%#{query}%"))).includes([:author, :tags]).published
    end

  end
end
