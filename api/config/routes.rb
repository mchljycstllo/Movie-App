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
      resources :comments

      post 'update-user-role' => 'users#update_user_role'

      scope 'pages' do
        get 'movie-create-page' => 'movies#movie_create_page'
        post 'movie-comment-page' => 'movies#get_movie_comments'
        get 'dashboard' => 'admin#dashboard'
      end
    end

    scope '/user' do
      resources :comments
      resources :ratings
      resources :favorites
      resources :users

      post 'get-user-via-id' => 'session#get_user_via_id'
    end

    scope '/frontend' do
      post 'all-movies' => 'frontend#all_movies'
      post match '/*path', to: 'frontend#single_movie', via: [:post]
    end
  end
end
