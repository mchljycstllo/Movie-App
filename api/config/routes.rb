Rails.application.routes.draw do
  resources :favorites
  resources :ratings
  resources :comments
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :movies

  namespace 'api' do
    get 'test-route' => 'dummy#test'
    get 'user-data' => 'session#show'
    post 'login' => 'session#create'
    
    scope '/cms' do
      resources :genre
      resources :movies
      resources :ratings
    end

    scope '/user' do
      resources :comments
      resources :ratings
      resources :favorites
    end
  end
end
