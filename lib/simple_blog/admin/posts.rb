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
      column('Tags')        { |post| post.tags.pluck(:name).join(', ') }
      column :published               
      column :date
      # TODO: Would be nice to actually have links to the categories in activeadmin
      column :category
      default_actions                   
    end

    # Show Page
    show do |blog_post|
      attributes_table do
        row :title
        row('Tags')         { |post| post.tags.pluck(:name).join(', ') }
        row :published
        row :date
        row :category
        row :content
      end
    end

    # Form
    form do |f|
      f.inputs "Post Details" do
        f.input :category
        f.input :title
        f.input :slug
        f.input :content
        f.input :excerpt
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
