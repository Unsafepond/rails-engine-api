Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show, :index], defaults: { format: 'json' }
        get "/merchants/find", to: "merchants#find"
        get "/merchants/find_all", to: "merchants#find_all"
        get "/merchants/most_revenue", to: "merchants#most_revenue"
        get "/merchants/:id/items", to: "merchants#items"
        get "/merchants/:id/invoices", to: "merchants#invoices"
        get "/merchants/:id/revenue", to: "merchants#revenue"
        get "/merchants/:id/favorite_customer", to: "merchants#favorite_customer"
        get "/merchants/:id/customers_with_pending_invoices", to: "merchants#customers_with_pending_invoices"

      resources :invoices, only: [:show, :index], defaults: { format: 'json' }
        get "/invoices/find", to: "invoices#find"
        get "/invoices/find_all", to: "invoices#find_all"
        get "/invoices/:id/transactions", to: "invoices#transactions"
        get "/invoices/:id/invoice_items", to: "invoices#invoice_items"
        get "/invoices/:id/items", to: "invoices#items"
        get "/invoices/:id/customer", to: "invoices#customer"
        get "/invoices/:id/merchant", to: "invoices#merchant"

      resources :invoice_items, only: [:show, :index], defaults: { format: 'json' }
        get "/invoice_items/find", to: "invoice_items#find"
        get "/invoice_items/find_all", to: "invoice_items#find_all"
        get "/invoice_items/:id/item", to: "invoice_items#item"
        get "/invoice_items/:id/invoice", to: "invoice_items#invoice"

      resources :items, only: [:show, :index], defaults: { format: 'json' }
        get "/items/find", to: "items#find"
        get "/items/find_all", to: "items#find_all"
        get "/items/:id/invoice_items", to: "items#invoice_items"
        get "/items/:id/merchant", to: "items#merchant"
        get "/items/most_revenue", to: "items#most_revenue"
        get "/items/most_items", to: "items#most_items"

      resources :customers, only: [:show, :index], defaults: { format: 'json' }
        get "/customers/find", to: "customers#find"
        get "/customers/find_all", to: "customers#find_all"
        get "/customers/:id/invoices", to: "customers#invoices"
        get "/customers/:id/transactions", to: "customers#transactions"
        get "/customers/:id/favorite_merchant", to: "customers#favorite_merchant"

      resources :transactions, only: [:show, :index], defaults: { format: 'json' }
        get "/transactions/find", to: "transactions#find"
        get "/transactions/find_all", to: "transactions#find_all"
        get "transactions/:id/invoice", to: "transactions#invoice"

    end
  end
end
