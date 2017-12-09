Rails.application.routes.draw do
  get 'user/login'
  get 'user/logout'
  get 'scoreboard/show'
  get 'time/get'
  resources:problems
  resources:question
  resources:submission
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
