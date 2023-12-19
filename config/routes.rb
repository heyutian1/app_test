Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "members", to: 'members#index'
  post "members/follow", to: 'members#follow'
  post "members/unfollow", to: "members#unfollow"
  get "members/:id/followers", to: 'members#followers'

  post "session/sign_in", to: "session#sign_in"
end
