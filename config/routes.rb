Rails.application.routes.draw do

  get "/posts" => 'posts#index'
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/comments' => 'comments#index'
  get '/users/:user_id/posts' => 'posts#index'
  delete '/posts/:id' => 'posts#destroy'
  post '/posts/:id/upvote' => 'posts#upvote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
