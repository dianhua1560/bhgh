Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
   get '/' => 'application#board'
   get '/board' => 'application#board'
   
   get '/board' => 'application#board'
   # authentication 
  get "/auth/google_oauth2/callback", to: "auth#google_callback"
  get "/auth/logout", to: "auth#logout"
  
  # Events
  get '/events/list' => 'events#list'
  post '/events/create' => 'events#create'
  get '/events/modal_show/:id' => 'events#modal_show'
  post '/events/respond/:id' => 'events#respond'
  get '/events/admin' => 'events#admin'
  post '/events/delete/:id'=>'events#delete'
  # get '/events' => 'events#index'
  # get '/events/show/:id' => 'events#show', as: 'event'
  # get '/events/modal_show/:id' => 'events#modal_show', as: 'event_modal'

  # get '/events/new' => 'events#new', as: 'new_event'
  # get '/events/edit/:id' => 'events#edit', as: 'edit_event'
  # post '/events/update' => 'events#update', as: 'update_event'
  # get '/events/admin' => 'events#admin', as: 'events_admin'
  # get '/events/delete' => 'events#delete', as: 'delete_event'
  # get 'events/respond' => 'events#respond', as: 'respond_to_event'
  # get 'events/delete_response' => 'events#delete_response', as: 'delete_event_response'
  
  # Brags
  # get '/brags' => 'brags#index', as: 'brags'
  # get '/brags/new' => 'brags#new', as: 'new_brag'
  # get '/brags/edit/:id' => 'brags#edit', as: 'edit_brag'
  # post 'brags/update' => 'brags#update', as: 'update_brag'
  # get '/brags/show/:id' => 'brags#show', as: 'brag'
  # get '/brags/modal_show/:id' => 'brags#modal_show', as: 'brag_modal'
  # get '/brags/admin' => 'brags#admin', as: 'brags_admin'
  # get '/brags/delete' => 'brags#delete', as: 'delete_brag'
  get '/brags/list' => 'brags#list'
  post '/brags/create' => 'brags#create'
  post '/brags/update/:id' => 'brags#update'
  post 'brags/delete/:id' => 'brags#delete'
  get '/brags/modal_show/:id' => 'brags#modal_show'
  post '/brags/like/:id' => 'brags#like'
  post '/brags/unlike/:id' => 'brags#unlike'


  # Forum
  get '/forum/list' => 'forum#list'
  post '/forum/create' => 'forum#create'
  post '/forum/create_response' => 'forum#create_response'
  post '/forum/delete_post/:id' => 'forum#delete_post'

  post '/forum/response/create/:id' => 'forum#response_create'
  post '/forum/response/update/:id' => 'forum#response_update'
  post '/forum/response/delete/:id' => 'forum#delete_response'

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
