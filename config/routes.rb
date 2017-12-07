Rails.application.routes.draw do
  config = Rails.application.config.ror2

  constraints host:config[:cost][:path]do
    namespace :cost,path:config[:cost][:path]do
      root 'top#index'
      get  'login' => 'sessions#new,as::login'
      resource :session,only:[:create,:destroy]
      resource :account,except:[:new,:create]
      resource :password,only[:show,:edit,:update]
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
    end
  end

  constraint host:config[:sales][:host]do
    namespace :customer,path:config[:sales][:path]do
      root'top#index'
    end
  end

  root'errors#not_found'
  get'anything'=>'errors#not_found'
end
