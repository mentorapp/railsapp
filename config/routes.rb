Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'
  resources :mentors
  #get 'mentors' => 'mentors#index'
  #get 'mentors/:id' => 'mentors#show'
  get 'users/:id' => 'users#show'
  get 'welcome/contact', to: 'welcome#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end