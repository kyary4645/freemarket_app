Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :destroy, :show]


  resources :users do
    member do
      get "tab"
    end
  end
  
  resources :signup, only: [:index,:create] do
    collection do
      get 'step1'
      post 'step1' => 'signup#post_step1'
      get 'step2'
      get 'step3'
      post 'step3' => 'signup#post_step3'
      get 'step4'
      get 'done'
    end
  end
end
