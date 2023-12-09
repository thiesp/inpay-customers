Customers::Engine.routes.draw do
  resources :customers, only: [:index,:show]
end
