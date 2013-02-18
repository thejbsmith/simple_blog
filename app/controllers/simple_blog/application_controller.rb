class SimpleBlog::ApplicationController < ApplicationController

  before_filter :load_data

  def load_data

    if !defined?(SimpleBlog.refreshed_time) || SimpleBlog.refreshed_time.blank? || SimpleBlog.refreshed_time < (Time.now - 10.minutes)

      # This is very simple memoization, only refreshing every 10 minutes.
      # If necessary, you can set SimpleBlog.refreshed_time outside of SimpleBlog in order to *trick* a refresh of content
      # Simple set SimpleBlog.refreshed_time to anything more than 10 minutes ago (or whatever the above value is)
      @@published_posts = SimpleBlog::Post.published.scoped(:include => [:author, :tags])
      @@categories = SimpleBlog::Category.all
      @@recent_posts = SimpleBlog::Post.find(:all, :order => 'date DESC', :limit => 10)
      @@authors = SimpleBlog.author_user_class.constantize.all
      @@tags = SimpleBlog::Tag.all.uniq { |tag| tag.name }
      @@archives = begin
        dates = SimpleBlog::Post.where(:published => true).order('date DESC').pluck(:date)
        dates.group_by{ |date| "#{date.month}/#{date.year}" }.collect{ |date| Date.strptime(date.first, "%m/%Y") }
      end

      SimpleBlog.refreshed_time = Time.now

    end

    @published_posts = @@published_posts
    @categories = @@categories
    @recent_posts = @@recent_posts
    @authors = @@authors
    @tags = @@tags
    @archives = @@archives
  end

  def simple_blog_current_user
    eval(SimpleBlog.current_user_method)
  end
  helper_method :simple_blog_current_user

end
