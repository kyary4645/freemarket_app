Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
