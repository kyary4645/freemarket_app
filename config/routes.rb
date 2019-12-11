Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :destroy, :show]
  resources :signup do
    collection do
      get 'index'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
  end
end
