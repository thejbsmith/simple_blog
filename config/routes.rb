SimpleBlog::Engine.routes.draw do
  
  resources :posts, :only => [] do
    resources :comments, :only =>[:create]
  end

  root :to => "posts#index"
  get '/page/:page' => 'posts#index'


  get '/posts/:slug'    => 'posts#show',      :as => :post

  # TODO: Might want to add a feed option to each 'page'
  get '/feed'                   => 'posts#feed',      :as => :feed,       :defaults => { :format => :rss }

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
