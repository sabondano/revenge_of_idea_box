Rails.application.routes.draw do
  resources :ideas, only: [:index]

  root 'welcome#index'
end
