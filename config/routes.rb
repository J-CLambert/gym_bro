Rails.application.routes.draw do
  devise_for :users
  #   patch "users", to: "pages#change_to_owner", as: "change_to_owner"
  put "toggle_owner_view", to: "pages#toggle_owner_view"
  root to: "pages#home"
     resources :gyms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
