Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :destroy, :show, :edit] do
    resources :purchase, only: [:show] do
      member do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end



  resources :users do
    member do
      get "profile"
      get "personalinformation"
      get "tab1"
      get "tab2"
      get "tab3"
      get "logout"
    end
  end
  
  resources :signup, only: [:index,:create] do
    collection do
      get 'step1'
      post 'step1', to: 'signup#post_step1'
      get 'step2'
      get 'step3'
      post 'step3', to: 'signup#post_step3'
      get 'step4'
      get 'done'
    end
  end
end
