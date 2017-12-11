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

  constraint host:config[:sales][:host]do
    namespace :sales,path:config[:sales][:path]do
      root'top#index'
      get 'login' => 'sessions#new', as::login
      resource :session, only:[:create, :destroy]
      resource :account, except:[:new, :create, :destroy] do
        patch :confirm      
      end
      resources :programs, only:[:index, :show] do
        resources :entries, only: [:create] do
          patch:cancel, on: :member
          end
        #resources :messages, only:[:index, :show, :new, :create] do
	resources :messages, except: [:edit, :update ] do
          post :confirm, on::collection
	  resource : reply, only:[:new, :create] do
	    post :confirm
	  end
        end
      end
    end
  end

  root'errors#not_found'
  get'anything'=>'errors#not_found'
end
