Rails.application.routes.draw do

  get 'kamonups', to: 'kamon_ups#index'
  get '/kamonups/:id', to: 'kamon_ups#show'

  mount Ckeditor::Engine => '/ckeditor'
  root 'top#index'

  get 'static_pages/help'
  get 'static_pages/pictures'
  get 'static_pages/design'
  get 'static_pages/markinfos'

namespace :rayadmin do
  root 'admins#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :customers
  resources :ordersheets
  resources :notes
  resources :sprices
  resources :pimages
  resources :markinfos
  resources :kamons
  resources :performs
  
  resources :projects do
    resources :tasks, only: [:create, :destroy]
  end
  
  post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'
  
  resources 'customers', only: :index do
    collection { post :import }
  end
end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
