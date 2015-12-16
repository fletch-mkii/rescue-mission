Rails.application.routes.draw do

  resources :questions do
    resources :answers, only: [:index, :create]
  end

root to: 'questions#index'
end
