BSG::Application.routes.draw do 

  resources :blogposts


  root to: 'static_pages#home'
  #get "static_pages/home"

  match '/about/company-info', to: 'static_pages#about_company_info'

  match '/our-work/a-game-of-zolf', to: 'static_pages#our_work_a_game_of_zolf'

  match '/our-work/misfortune-cookie-box', to: 'static_pages#our_work_misfortune_cookie_box'

  match '/our-work/app-development', to: 'static_pages#our_work_app_development'

  match '/contact-success', to: 'static_pages#contact_success'

  match 'contact', to: 'contact#new', :as => 'contact', :via => :get
  match 'contact', to: 'contact#create', :as => 'contact', :via => :post

  match '/blog', to: 'blogposts#index'

  match '/blog-admin', to: 'blogposts#admin_index'

  #match 'blogposts/:id', to: 'blogposts#show'

  match  'archive/:year(/:month(/:day))' => 'archives#monthly_index', :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }

 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
