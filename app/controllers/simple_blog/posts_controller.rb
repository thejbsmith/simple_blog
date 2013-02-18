require_dependency "simple_blog/application_controller"

module SimpleBlog
  class PostsController < ApplicationController

    def index
      @posts = @published_posts.page(params[:page])

      respond_to do |format|
        format.html
        format.rss
      end
    end
  
    def show
      @post = Post.where(:slug => params[:slug]).includes([:author, :tags, :open_graph_tags, :comments => [:commenter]]).first
      @related_posts = @post.related_posts

      set_meta_tags :title => @post.title

      unless @post.meta_description.blank?
        set_meta_tags :description => @post.meta_description
      end

      unless @post.meta_keywords.blank?
        set_meta_tags :keywords => @post.meta_keywords
      end

      unless @post.open_graph_tags.empty?
        set_meta_tags :open_graph => Hash[ @post.open_graph_tags.map { |open_graph_tag| [open_graph_tag.name, open_graph_tag.content] } ]
      end

    end

    def category
      @category = Category.where(:slug => params[:slug]).first
      @posts = Post.where(:category_id => @category.id).includes([:author, :tags]).published.page(params[:page])

      set_meta_tags :description => "Blog articles for #{@category.name}"
      set_meta_tags :keywords => "blog, #{@category.name}"

      respond_to do |format|
        format.html
        format.rss
      end
    end

    def archive
      @month = params[:month].to_i
      @year  = params[:year].to_i
      @posts = Post.published_in(@month, @year).page(params[:page])

      set_meta_tags :description => "Blog archive for #{Date::MONTHNAMES[@month]} #{@year}"
      set_meta_tags :keywords => "blog, archive, #{Date::MONTHNAMES[@month]} #{@year}"
    end

    def tag
      @tag = params[:tag]
      @posts = Post.tagged_with(@tag)
      # For some reason Kaminari doesn't want to play nicely with join, where, and includes methods in a query (Kaminari is not returning all fields when the page method is called)
      # In order to circumvent this, we are converting our active relation object to an array, and using Kaminari's paginate_array method to mock the same functionality
      @posts = Kaminari.paginate_array(@posts.to_a).page(params[:page]).per(9)   # Since we are paginating an array (not our Post model), we need to specify how many items per page

      set_meta_tags :description => "Blog posts tagged with #{@tag}"
      set_meta_tags :keywords => "blog, #{@tag}"

      respond_to do |format|
        format.html
        format.rss
      end
    end

    def search
      @query = params[:q]
      @posts = Post.search(@query).page(params[:page])

      set_meta_tags :description => "Blog posts matching search query #{@query}"
      set_meta_tags :keywords => "blog, #{@query}"
    end

    def author
      @author = SimpleBlog.author_user_class.constantize.find(params[:author_id])
      @author_display_name = @author.instance_eval("self.#{SimpleBlog.author_user_class_display_field}")
      @posts = Post.where(:author_id => params[:author_id]).includes([:author, :tags]).published.page(params[:page])

      set_meta_tags :description => "Blog posts written by #{@author_display_name}"
      set_meta_tags :keywords => "blog, #{@author_display_name}"

      respond_to do |format|
        format.html
        format.rss
      end
    end

  end
end
