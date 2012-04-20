KwPortalffa::Application.routes.draw do


  get "ver/index"
  get "home/index"
  resources :user_sessions
  resources :users
  resources :password_resets
  resources :atualizar
  
  #-----------------------------------------------INGRESSOS
  namespace(:ingressos){
    resources :selecione
    resources :confira
    resources :pagamento
    resources :retorno
  }
  #-----------------------------------------------INGRESSOS
  
  #Inicio do namespace Admin
  namespace(:admin){
    resources :searchs do
      collection do
        get 'results'
        get 'resend'  
      end
      member do
        get 'baixa'
      end
    end
    resources :reports
    resources :uploads
    resources :upload_categories
    resources :galleries do
      resources :gallery_images
    end
    resources :tickets
    resources :ticket_types
    resources :ticket_categories
    resources :complement_menus
    resources :templates do
      resources :webmodules do
        collection do
          get 'buttoms'
        end
      end
    end
    resources :webparts               
    resources :categories do
      resources :subcategories do
        resources :contents do
          resources :movies 
        end #Fim do contents  
      end #Fim do subcategories  
    end #Fim do categories    
    
    #Inicio do Padrão Administrador
    resources :static_contents
    resources :users do
      collection do
        get 'search'
      end
    end
    
    #Fim do Padrão Administrador
    root :to => "static_contents#index"
  }
  #Final do namespace Admin
  
  root :to => "home#index"
  match 'cadastro' => "users#new"
  match 'login' => 'user_sessions#new'  
  match 'logout' => 'user_sessions#destroy'  
  match ':category(/:subcategory(/:content))' => 'ver#index'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
