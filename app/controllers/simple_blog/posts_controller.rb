require_dependency "simple_blog/application_controller"

module SimpleBlog
  class PostsController < ApplicationController

    def index
      @posts = Post.published.paginate(:page => params[:page])
    end
  
    def show
      @post = Post.find_by_slug(params[:slug])

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
      @category = Category.find_by_slug(params[:slug])
      @posts = Post.published_in_category(@category).paginate(:page => params[:page])

      set_meta_tags :description => "Smarteys blog articles for #{@category.name}"
      set_meta_tags :keywords => "smarteys, blog, #{@category.name}"
    end

    def feed
      @posts = Post.published
      respond_to do |format|
        format.rss { render :layout => false } #index.rss.builder
        format.all { head :not_found }
      end
    end

    def archive
      @month = params[:month].to_i
      @year  = params[:year].to_i
      @posts = Post.published_in(@month, @year).paginate(:page => params[:page])

      set_meta_tags :description => "Smarteys blog archive for #{Date::MONTHNAMES[@month]} #{@year}"
      set_meta_tags :keywords => "smarteys, blog, archive, #{Date::MONTHNAMES[@month]} #{@year}"
    end

    def tag
      @tag = params[:tag]
      @posts = Post.tagged_with(@tag).paginate(:page => params[:page])

      set_meta_tags :description => "Smarteys blog posts tagged with #{@tag}"
      set_meta_tags :keywords => "smarteys, blog, #{@tag}"
    end

    def search
      @query = params[:q]
      @posts = Post.search(@query).paginate(:page => params[:page])

      set_meta_tags :description => "Smarteys blog posts matching search query #{@query}"
      set_meta_tags :keywords => "smarteys, blog, #{@query}"
    end

    def author
      author = SimpleBlog.author_user_class.constantize.find(params[:author_id])
      @author_display_name = author.instance_eval("self.#{SimpleBlog.author_user_class_display_field}")
      @posts = Post.where(:author_id => params[:author_id]).paginate(:page => params[:page])

      set_meta_tags :description => "Smarteys blog posts written by #{@author_display_name}"
      set_meta_tags :keywords => "smarteys, blog, #{@author_display_name}"
    end

  end
end
