SimpleBlog::Engine.routes.draw do
  
  resources :posts, :only => [:index] do
    resources :comments, :only =>[:create]
  end

  root :to => "posts#index"
  get '/page/:page' => 'posts#index'

  scope 'posts' do
    get '/:slug'                    => 'posts#show',      :as => :post
  end

  scope '/archive' do
    get ':year/:month'              => 'posts#archive',   :as => :archive
    get '/:year/:month/page/:page'  => 'posts#archive'
  end

  scope '/tags' do
    get ':tag'                      => 'posts#tag',       :as => :tag
    get ':tag/page/:page'           => 'posts#tag'
  end

  scope '/search' do
    get '/'                         => 'posts#search',    :as => :search
  end

  scope '/categories' do
    get '/:slug'                    => 'posts#category',  :as => :category
    get '/:slug/page/:page'         => 'posts#category'
  end

  scope '/authors' do
    get '/:author_id'               => 'posts#author',    :as => :author
    get '/:author_id/page/:page'    => 'posts#author'
  end

end
