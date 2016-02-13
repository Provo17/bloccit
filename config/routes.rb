Rails.application.routes.draw do

resources :posts

resources :advertisement

get 'about' => 'welcome#about'

  root 'welcome#index'
end
