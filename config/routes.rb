Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'
  get 'bookings/new.:id', to: 'bookings#new'
  resources :mentors, :charges, :bookings, :searches
  get 'users/:id' => 'users#show'
  get 'welcome/contact', to: 'welcome#contact'
  # get 'charge/create', to: 'user/show' - this is an idea to get the Stripe charge to redirect to user page with a notice that charge was successful
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end