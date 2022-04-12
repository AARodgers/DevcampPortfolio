Rails.application.routes.draw do
  # holds all the routes for devise
  # to change the paths for the devise gem add what is after users ( ex.sign_in turns into login)
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # porfolio is a specific route that takes in an id parameter and is mapped to the show action

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
