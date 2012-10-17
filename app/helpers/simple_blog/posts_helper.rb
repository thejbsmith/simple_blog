module SimpleBlog
  module PostsHelper

    def post_title_link(post)
      link_to(post.title, post_path(post.slug)).html_safe
    end

    def category_link(category)
      link_to(category.name, category_path(category.slug)).html_safe
    end

    def tag_links(tags)
      tags.collect { |tag| link_to(tag.name, tag_path(tag.name)) }.join(', ').html_safe
    end

  end
end
