module SimpleBlog
  module ApplicationHelper

    def get_categories
      Category.all
    end

    def get_recent_posts(count)
      Post.find(:all, :order => 'date DESC', :limit => count)
    end

    def get_authors
      SimpleBlog.author_user_class.constantize.all
    end

    def get_tags
      Tag.all.uniq { |tag| tag.name }
    end

    def get_archives
      dates = Post.order('date DESC').pluck(:date)
      # TODO: Will this work since it procudes 2012/5 instead of 2012/05?
      dates.group_by{ |date| "#{date.month}/#{date.year}" }.collect{ |date| Date.strptime(date.first, "%m/%Y") }
    end

  end
end
