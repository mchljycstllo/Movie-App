Rails.application.routes.draw do
  resources :artists
  resources :favorites
  resources :ratings
  resources :comments
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace 'api' do
    get 'test-route' => 'dummy#test'
    get 'user-data' => 'session#show'
    post 'login' => 'session#create'
    
    scope '/cms' do
      resources :genre
      resources :movies
      resources :ratings
      resources :artists
      resources :users

      post 'update-user-role' => 'users#update_user_role'

      scope 'pages' do
        get 'movie-create-page' => 'movies#movie_create_page'
        get 'dashboard' => 'admin#dashboard'
      end
    end

    scope '/user' do
      resources :comments
      resources :ratings
      resources :favorites
    end

    scope '/frontend' do
      get 'all-movies' => 'frontend#all_movies'
      get match '/*path', to: 'frontend#single_movie', via: [:get]
    end
  end
end
