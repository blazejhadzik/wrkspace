Rails.application.routes.draw do
  namespace :contacts do
    resources :people
    resources :organizations
  end

  namespace :admin do
    resources :users, only: %i[index new create] do
      put :suspend
    end
  end

  resources :cases
  resources :people
  resources :organizations

  root to: "cases#index"
end
