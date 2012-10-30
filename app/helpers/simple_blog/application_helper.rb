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
      Tag.pluck(:name).uniq
      Tag.all.uniq { |tag| tag.name }
    end

    def get_archives
      dates = Post.order('date DESC').pluck(:date)
      # TODO: Will this work since it procudes 2012/5 instead of 2012/05?
      dates.group_by{ |date| "#{date.month}/#{date.year}" }.collect{ |date| Date.strptime(date.first, "%m/%Y") }
    end


    # Based on https://gist.github.com/1182136
    class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
      protected

      def html_container(html)
        tag :div, tag(:ul, html), container_attributes
      end

      def page_number(page)
        tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
      end

      def gap
        tag :li, link(super, '#'), :class => 'disabled'
      end

      def previous_or_next_page(page, text, classname)
        tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
      end
    end

    def page_navigation_links(pages)
      will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
    end

  end
end
