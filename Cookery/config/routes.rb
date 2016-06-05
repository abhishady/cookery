Rails.application.routes.draw do
  get 'admin/admin_view'

  get 'add_dish/adview'

  get 'categories/catview'

  get 'userdetail/udview'

  get 'userdetail/user_detail_review'

  get 'review/rview'

  get 'dish/dishview'

  get 'user/uview'

  match 'admin', to: 'user#index', via: [:get, :post]
  match 'home', to: 'home#view', via: [:get, :post]
  match 'chef', to: 'add_dish#index', via: [:get, :post]
  match 'dishes', to: 'dish#allDish', via: [:get, :post]
  # match 'recipes', to: 'dish#dishDetail', via: [:get, :post]

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
    get ':controller(/:action(/:id(.:format)))' => 'foo#matcher'
    post ':controller(/:action(/:id(.:format)))' => 'foo#matcher'
end
