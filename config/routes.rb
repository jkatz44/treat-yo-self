Rails.application.routes.draw do
  root 'welcome#index'

  get 'customer' => 'customer#customer_view_cards'
  get 'customer/customer_add_phonenumber_to_account' => 'customer#add_phonenumber_to_account'
  patch 'customer/do_add_phonenumber_to_account' => 'customer#do_add_phonenumber_to_account'
  
  get 'business_signup'  => 'businesses#new' 
  resources :businesses
  
  get '/business_login' => 'sessions#business_new'
  post '/business_login' => 'sessions#business_create'
  delete 'business_logout' => 'sessions#business_destroy'
  
  get 'business_options' => 'businesses#options'
  get 'business_view_cards' => 'businesses#business_view_cards'
  get 'business/update_card' => 'businesses#update_card'
  patch 'business/something' => 'businesses#check_phone_number'
  get 'business/add_card' => 'businesses#add_card'
  patch 'business/do_add_card' => 'businesses#do_add_card'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :cards

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
