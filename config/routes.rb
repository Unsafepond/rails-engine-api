Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show], defaults: { format: 'json' }
        get "/merchants/:id/items", to: "merchants#items"
        get "/merchants/:id/invoices", to: "merchants#invoices"

      resources :invoices, only: [:show], defaults: { format: 'json' }
        get "/invoices/:id/transactions", to: "invoices#transactions"
        get "/invoices/:id/invoice_items", to: "invoices#invoice_items"
        get "/invoices/:id/items", to: "invoices#items"
        get "/invoices/:id/customer", to: "invoices#customer"
        get "/invoices/:id/merchant", to: "invoices#merchant"

      resources :invoice_items, only: [:show], defaults: { format: 'json' }
        get "invoice_items/:id/item", to: "invoice_items#item"
        get "invoice_items/:id/invoice", to: "invoice_items#invoice"

      resources :items, only: [:show], defaults: { format: 'json' }
      resources :customers, only: [:show], defaults: { format: 'json' }
      resources :transactions, only: [:show], defaults: { format: 'json' }
    end
  end
end
