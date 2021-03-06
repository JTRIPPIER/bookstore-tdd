Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create]
  end


  resources :reviews, only: :index

  namespace :admin do
    resources :books, only: [:index, :edit, :update, :new, :create]
  end
end
