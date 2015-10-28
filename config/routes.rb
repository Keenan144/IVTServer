Rails.application.routes.draw do

  match '/scan_code' => 'code_scan#scan_code_get', via: :get 
  match '/scan_code' => 'code_scan#scan_code_post', via: :post


  root 'units#index'
  get '/create_account' => 'users#new'

  get 'logout'  => 'sessions#destroy'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/dashboard' => 'static_pages#dashboard'
  get '/all_scans' => 'units#all'
  get '/search' => 'units#search'
  
  namespace :admin, constraints: { subdomain: '' } do 
    resources :sign_ups, only: [:index, :edit] do
      collection do
        post :approve
      end
    end
    resources :admin_view do
      collection do
        post :approve
      end
    end
    resources :bill_of_ladings do
      collection do
        post :approve
      end
    end
  end




  resources :companies
  resources :units
  resources :users


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
