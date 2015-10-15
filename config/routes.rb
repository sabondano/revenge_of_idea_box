Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :ideas, only: [:index, :create, :destroy]
      patch "/ideas/:id/thumbs-up", to: "ideas#thumbs_up"
      patch "/ideas/:id/thumbs-down", to: "ideas#thumbs_down"
    end
  end

  resources :ideas, only: [:edit, :update]

  root 'welcome#index'
end
