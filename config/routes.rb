Rails.application.routes.draw do
  config = Rails.application.config.ror2

  constraints host:config[:cost][:path]do
    namespace :cost,path:config[:cost][:path]do
      root 'top#index'
      get  'login' => 'sessions#new,as::login'
      resource :session, only:[:create,:destroy]
      resource :account, except:[:new,:create] do
        patch :confirm
      end
      resource :password, only:[:show,:edit,:update]
      #resource :sales
      resources :sales
      resources :programs do
        patch :entries, on: :member
      end
      resources :messages, only: [] do
	      get :count, on: :collection
      end
    end
  end

  constraints host:config[:profit][:host]do
    namespace :profit,path:config[:profit][:path]do
      root 'top#index'
      get  'login' => 'sessions#new', as:login
      resource    :session, only:[:create,:destroy]
      resources   :cost_members do
        resources :cost_events,only:[:index]
      end
      resources   :cost_events,only:[:index]
      resources   :allowed_sources, only:[:index,:create]do
	      delete :delete, on: :collection
      end
    end
  end

 #constraint host: config[:sales][:host] do
  #namespace :sales, path: config[:sales][:path]do
     #root 'top#index'
      get 'login'      => 'sessions#new',    as: :login
      post 'session'   => 'sessions#create', as: :session
      delete 'session' => 'sessions#destroy'
      resource :session, only:[:create, :destroy]
      resource :account, except:[:new, :create, :destroy] do
        patch :confirm      
      end
      resources :programs, only:[:index, :show] do
        resources :entries, only: [:create] do
          patch:cancel, on: :member
          end
      end
      reources :messages, only:[ :new, :create ] do
	      post :confirm, on: :collection
      end
        #resources :messages, only:[:index, :show, :new, :create] do
	#
        #resources :messages, except: [:edit, :update ] do
        #  post :confirm, on::collection
	#  resource : reply, only:[:new, :create] do
	#    post :confirm
	#  end
        #end
        resources :messages, only: [:index, :show, :destroy] do
		get :inbound, :outbound, :deleted, :count, on: :collection
		post :tag,   on: :member
		delete :tag, on: :member
		resource :reply, only: [:new, :create] do
			post :confirm
		end
	end
	resources :tags, only:[] do
	  resources :messages, only:[:index] do
	    get :inbound, :outbound, :deleted, on: :colelction
	  end
	end
    end
  end
 #constraint host: config[:sales][:host] do
  #namespace :sales, path: config[:sales][:path]do
  constraing host: config[:sales][:host] do
   namespace :sales, path: config[:sales][:path] do
     root'top#index'
   end
end
 
  root'errors#not_found'
  get'anything'=>'errors#not_found'
end

