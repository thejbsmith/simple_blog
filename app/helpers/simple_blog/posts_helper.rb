module SimpleBlog
  module PostsHelper

    def post_title_link(post)
      link_to(post.title, post_path(post.slug)).html_safe
    end

    def post_author_link(post)
      link_to(post.author.instance_eval("self.#{SimpleBlog.author_user_class_display_field}"), author_path(post.author)).html_safe
    end

    def category_link(category)
      link_to(category.name, category_path(category.slug)).html_safe
    end

    def tag_links(tags)
      tags.collect { |tag| link_to(tag.name, tag_path(tag.name)) }.join(', ').html_safe
    end

    def commenter_name(comment)
      (comment.commenter.nil?) ? 'Anonymous' : comment.commenter.instance_eval("self.#{SimpleBlog.commenter_user_class_display_field}")
    end

    def allow_comments?
      if SimpleBlog.enable_comments
        unless simple_blog_current_user.nil?
          return true
        else
          if SimpleBlog.only_allow_users_to_comment == true
            return false
          else
            return true
          end
        end
      end
    end

  end
end
