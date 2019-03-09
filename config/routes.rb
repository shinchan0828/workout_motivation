Rails.application.routes.draw do

  devise_for :users
  get 'users/new'
  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  resources :users, only:[:index, :show]
  resources :foodmenus, only:[:index,:new, :edit, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
