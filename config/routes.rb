Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :destroy, :show] do
    resources :purchase, only: [:show] do
      collection do
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
