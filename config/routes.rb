Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      scope "/customers/:customer_id", as: :customer do 
        resources :subscriptions, only: [:index, :create, :update]
      end
    end
  end
end