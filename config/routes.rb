SimpleBlog::Engine.routes.draw do
  
  resources :posts do
    resources :comments
  end
  resources :categories

  root :to => "posts#index"

end
