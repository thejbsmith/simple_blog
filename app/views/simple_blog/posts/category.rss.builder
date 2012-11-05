xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{SimpleBlog.blog_name} | #{@category.name}"
    xml.description SimpleBlog.blog_description if SimpleBlog.blog_description
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.excerpt
        xml.pubDate post.date.to_s(:rfc822)
        xml.link post_url(post.slug)
        xml.guid post_url(post.slug)
        xml.author post.author.instance_eval("self.#{SimpleBlog.author_user_class_display_field}")
      end
    end
  end
end
