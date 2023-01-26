Rails.application.routes.draw do
  resources :favorites
  #devise_for :users
  resources :movies
  namespace 'api' do
    get 'test-route' => 'dummy#test'

    scope '/authentication' do
      post 'login' => 'authentication#login'
      post 'logout' => 'authentication#logout'
    end

    scope '/user' do
      post 'register' => 'user#create'
    end
    
    scope '/cms' do
      resources :genre
      resources :movies
    end

    scope '/user' do
      #
    end
  end
end
