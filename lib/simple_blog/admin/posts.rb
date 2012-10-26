if defined?(ActiveAdmin)

  ActiveAdmin.register SimpleBlog::Post, :as => 'Post' do
    # controller do
    #   authorize_resource
    #   include ActiveAdminCanCan
    # end

    # Menu
    menu :parent => 'Blog', :label => 'Posts'

    # Index Page
    index do                            
      column :title
      column('Tags')          { |post| post.tags.pluck(:name).join(', ') }
      column :published               
      column :date
      column :category
      default_actions                   
    end

    # Show Page
    show do |blog_post|
      attributes_table do
        row :title
        row('Tags')           { |post| post.tags.pluck(:name).join(', ') }
        row :published
        row :date
        row :category
        row('Content')        { |post| post.content.html_safe }
      end
    end

    # Form
    form :html => {:multipart => true} do |f|
      f.inputs "Post Details" do
        f.input :category
        f.input :title
        f.input :slug
        f.input :featured_image, :as => :rich_picker, :config => { :style => 'width: 400px !important;', :placeholder_image => image_path('simple_blog/placeholder.png'), :preview_size => '200px' }
        f.input :content, :as => :rich, :config => { :width => '76%', :height => '400px' }
        f.input :excerpt, :as => :rich, :config => { :width => '76%', :height => '400px' }
        f.input :date
        f.input :published, :as => :radio
        f.has_many :tags do |tag|
          tag.inputs "Tags" do
            tag.input :name
            # TODO: Look at adding AJAX link to remove tags
            tag.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
            #link_to "Delete", edit_admin_tag_path(tag.object), method: "delete", class: "button" unless tag.object.new_record?
          end
        end
      end
      f.actions do
        f.action :submit
        f.action :cancel, :wrapper_html => { :class => "cancel" }
      end
    end

  end

end