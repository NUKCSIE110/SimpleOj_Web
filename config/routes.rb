Rails.application.routes.draw do
  get 'user/login'
  get 'user/logout'
  resources:problems
  resources:question
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
