Rails.application.routes.draw do
  devise_for :users
  resources :gyms do
    resources :bookings, only: [:index, :new, :create] do
    end
  end

  resources :bookings, only: [] do
    get :requested, on: :collection
  end
  resources :bookings do
    put :confirm, on: :member
    put :training_ended, on: :member
  end



  #   patch "users", to: "pages#change_to_owner", as: "change_to_owner"
  put "toggle_owner_view", to: "pages#toggle_owner_view"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
