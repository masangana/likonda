Rails.application.routes.draw do
  root "splash#index"
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/create'
  get 'budgets/index'
  get 'budgets/show'
  get 'budgets/new'
  get 'budgets/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
