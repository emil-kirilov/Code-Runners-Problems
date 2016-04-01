Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  patch '/products/:id/bid' => 'products#update_highest_bidder2'
  resources :users#, only: %i(new show create)
  resources :products#, only: %i(new show create index)
end

