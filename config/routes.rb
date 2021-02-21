Rails.application.routes.draw do
  devise_for :users,
  controllers: {registrations: "registrations"}
  #get "pages/home"以下のように書き換えられる。(URLがhttp://localhost:3000/になる。)
  root "pages#home"
  get "/users/:id", to: "users#show", as:"user"

#resourcesを使って、以下のように書き換えられる。
  # get "/posts/new", to: "posts#new"
  # post "/posts", to: "posts#create"
  # post "/posts/:post_id/photos", to: "photos#create", as:"post_photos"
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
end
