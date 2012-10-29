require_dependency "simple_blog/application_controller"

module SimpleBlog
  class PostsController < ApplicationController

    def index
      @posts = Post.published
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
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
    end
  
    def new
      @post = Post.new
      @post.date = Time.now
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @post }
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def create
      @post = Post.new(params[:post])
  
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      @post = Post.find(params[:id])
  
      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
  
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end



    def category
      @category = Category.find_by_slug(params[:slug])
      @posts = Post.published_in_category(@category)
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
      @posts = Post.published_in(@month, @year)
    end

    def tag
      @tag = params[:tag]
      @posts = Post.tagged_with(@tag)
    end

    def search
      @query = params[:q]
      @posts = Post.search(@query)
    end

  end
end
