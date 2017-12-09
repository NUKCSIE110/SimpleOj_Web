Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/scoreboard', to: 'scoreboard#show'
  get '/time',       to: 'time#get'
  resources:problems
  resources:question
  resources:submission
  post 'judge/:id/update', to: 'judge#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
