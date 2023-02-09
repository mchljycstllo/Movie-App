Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :movies

  namespace 'api' do
    get 'test-route' => 'dummy#test'
    get 'user-data' => 'session#show'
    post 'login' => 'session#create'
    
    scope '/cms' do
      resources :genre
      resources :movies
    end

    scope '/user' do
      #
    end
  end
end
