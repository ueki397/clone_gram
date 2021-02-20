Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "pages/home"以下のように書き換えられる。(URLがhttp://localhost:3000/になる。)
  root "pages#home"

  get "/users/:id", to: "users#show", as:"user"
end
