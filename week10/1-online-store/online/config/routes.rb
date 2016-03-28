Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
 #brands
  get 'brands/count', to: 'brands#count'
  get 'brands/new' ,to: 'brands#new'
  post 'brands/new',to: 'brands#create'
  get 'brands/range/:id',to: 'brands#range_with_index'
  get 'brands/range/:id/count',to: 'brands#count_range'
  get 'brands',to: 'brands#show'
  get 'brands/:id',to: 'brands#index'
  delete 'brands/:id', to: 'brands#destroy'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
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
