Rails.application.routes.draw do
  resources :ideas do
    member do
      post :vote
    end
  end
  root 'ideas#index'
end
