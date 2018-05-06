Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations/registrations'
  }
  namespace :contacts do
    resources :people
    resources :organizations
  end

  namespace :admin do
    resources :users, only: %i[index new create] do
      put :suspend
    end
  end

  namespace :api do
    resources :tasks, only: %i[index create destroy update]
  end

  resources :cases
  resources :people
  resources :organizations

  root to: 'cases#index'
end
