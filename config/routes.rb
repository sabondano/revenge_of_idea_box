Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :ideas, only: [:index, :create]
    end
  end

  root 'welcome#index'
end
