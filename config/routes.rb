SimpleBlog::Engine.routes.draw do
  
  resources :posts, :only => [] do
    resources :comments, :only =>[:create]
  end

  root :to => "posts#index"


  get '/posts/:slug'    => 'posts#show',      :as => :post

  # TODO: Might want to add a feed option to each 'page'
  get '/feed'                   => 'posts#feed',      :as => :feed,       :defaults => { :format => :rss }
  get '/archive/:year/:month'   => 'posts#archive',   :as => :archive
  get '/tags/:tag'              => 'posts#tag',       :as => :tag
  get '/search'                 => 'posts#search',    :as => :search
  get '/:slug'                  => 'posts#category',  :as => :category

end
