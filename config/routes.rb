Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, except: :index do
    resources :doses, only: [:create, :new]
  end
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
end

# only need nested routes for new & create
# otherwise just use shallow routes
# also only 1 level of nesting
