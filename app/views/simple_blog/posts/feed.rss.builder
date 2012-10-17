xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blog title goes here"
    xml.description "Blog description goes here"
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.excerpt
        xml.pubDate post.date.to_s(:rfc822)
        xml.link post_url(post.slug)
        xml.guid post_url(post.slug)
      end
    end
  end
end
