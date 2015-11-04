Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show], defaults: { format: 'json' }
        get "/merchants/:id/items", to: "merchants#items"

      resources :invoices, only: [:show], defaults: { format: 'json' }
      resources :invoice_items, only: [:show], defaults: { format: 'json' }
      resources :items, only: [:show], defaults: { format: 'json' }
      resources :customers, only: [:show], defaults: { format: 'json' }
      resources :transactions, only: [:show], defaults: { format: 'json' }
    end
  end
end
