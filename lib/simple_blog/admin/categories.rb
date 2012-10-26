if defined?(ActiveAdmin)
  ActiveAdmin.register SimpleBlog::Category, :as => 'Categories' do
    # controller do
    #   authorize_resource
    #   include ActiveAdminCanCan
    # end

    # Menu
    menu :parent => 'Blog', :label => 'Categories'

    # Index Page
    index do                            
      column :name
      column('Posts') { |category| category.posts.count }
      default_actions                   
    end

    # Show Page
    show do |category|
      attributes_table do
        row :name
        row('Posts') { |category| category.posts.count }
      end

      panel "Posts" do
        table_for category.posts do |t|
          t.column('Title') { |post| link_to(post.title, admin_post_path(post)) }
          t.column('Tags')  { |post| post.tags.pluck(:name).join(', ') }
          t.column :published               
          t.column :date     
          t.column('') do |post|
            links = ''.html_safe
            links += link_to('Edit', edit_admin_post_path(post))
            links += ' '
            links += link_to('Delete', admin_post_path(post), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'))
            links
          end
        end  
      end
    end

    # Form
    form do |f|
      f.inputs "Category Details" do
        f.input :name
        f.input :slug
        f.input :position
      end
      f.actions do
        f.action :submit
        f.action :cancel, :wrapper_html => { :class => "cancel" }
      end
    end

  end

end
