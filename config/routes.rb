Rails.application.routes.draw do
  resources :technicalsupports do
    resources :tecnichsales 
  end
  resources :faultreqs
  resources :orders do
    resources :reqitems
  end
  resources :baskets do
    resources :salesproducts
  end

  resources :customerbalances
  
  resources :products
  resources :brands
  get 'customer/index'
  get 'customer/new'
  get 'customer/show'
  get 'customer/edit'
  #sessions
  resource :session ,only: [:new, :create, :destroy]
  get '/oturum_ac', to: 'sessions#new', as: :login
  delete '/oturumu_kapat', to: 'sessions#destroy', as: :logout

  resources :users, except: :index
  get '/kaydol', to: 'users#new',  as: :register
  get '/users/new', to: redirect('/kaydol')
  get '/:id', to: 'users#show', as: :profile
  get '/:id/edit', to: 'users#edit', as: :edit_profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#new"
  
  
end
