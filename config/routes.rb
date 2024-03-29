Rails.application.routes.draw do


   get 'portfolios/view' => 'portfolios#view'


  resources :portfolios
  resources :jobs
  resources :themes
  resources :sites
  get 'users/profile'
  get 'users/dash_board'
  get 'image/call' => "image#call"
  mount Ckeditor::Engine => '/ckeditor'

  resources :posts do
    resources :comments
  end  

  #devise_for :users
  devise_for :users, :controllers => {omniauth_callbacks: 'omniauth_callbacks', :registrations => "registrations"}

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

  root 'home#index'

  get 'page/routing_error'

  match 'about' => 'page#about', :as => :about, via: [:get, :post]
  match 'contact' => 'page#contact', :as => :contact, via: [:get, :post]

  if Rails.env.production?
    match '*a' => 'page#routing_error', :as => :routing_error, via: [:get, :post]
  end
end
