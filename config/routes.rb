Rails.application.routes.draw do
  get 'to_do_list/index'
  root 'to_do_list#index'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
