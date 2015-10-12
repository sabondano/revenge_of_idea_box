Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      resources :ideas, only: [:index]
    end
  end

  root 'welcome#index'
end
