simple_blog
===========

Simple blog engine for Rails

Add to gemfile

# Will install SimpleBlog at /blog
# as well as Rich at /rich
rails generate simple_blog:install

Add SimpleBlog link to your navigation:
  <li><%= link_to('Blog', main_app.blog_path) %></li>

If using devise add:
config.authentication_method = :authenticate_admin_user!
to your initializers/rich file
(this will be based on the admin model you are using, this assumes Adminuser)
(link to rich for more info)

If using ActiveAdmin add:
//= require rich
to app/assets/javascripts/active_admin.js

SimpleBlog uses meta-tags (link to meta-tags gem)
In order to display the meta tags correctly, go to your applications layout file and add
<%= display_meta_tags :site => 'My website' %> (this will display each blog post in the title tag as My Website | Blog Post Title)
  If you don't want to show your site name, simple remove the :site reference
This will replace the 'title' tag, so remove that from your application layout as well
In each blog post you can currently specify keywords and description. The title is used as the meta title



## Maybe ask if user is using ActiveAdmin
  # If so, then add defaults

## Maybe ask if user is using S3
  # If so, then add defaults
  # add aws-sdk gem to gemfile
  # add environmental configuration for paperclip

### NOTE: ###
# SimpleBlog will use your application layout.
# If you have a navigation that will be used on a page for SimpleBlog, you must change the links
# Since the links will reference your main app, once they get inside SimpleBlog's isolated namespace, they will try to reference that namespace
# In order to fix this, simple prefix items with main_app. such as blog_path becomes main_app.blog_path
