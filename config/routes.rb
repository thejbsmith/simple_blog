SimpleBlog::Engine.routes.draw do
  
  resources :posts, :only => [] do
    resources :comments, :only =>[:create]
  end
  # resources :categories

  root :to => "posts#index"


  get '/posts/:slug'    => 'posts#show',      :as => :post

  # TODO: Will need to figure out a way to handle searches with Postgres, or even abstractly
  # get '/search'         => 'posts#search',    :as => :search

  # TODO: Might want to add a feed option to each 'page'
  get '/feed'                   => 'posts#feed',      :as => :feed,       :defaults => { :format => :rss }
  get '/archive/:year/:month'   => 'posts#archive',   :as => :archive
  get '/tags/:tag'              => 'posts#tag',       :as => :tag

  get '/:slug'                   => 'posts#category',  :as => :category    

end
