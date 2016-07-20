Rails.application.routes.draw do
  get 'issues/index'

  get 'issues/show'

  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
