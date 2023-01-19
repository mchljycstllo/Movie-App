Rails.application.routes.draw do
  resources :movies
  namespace 'api' do
    get 'test-route' => 'dummy#test'
    
    scope '/cms' do
      resources :genre
      resources :movie
    end

    scope '/user' do
      #
    end
  end
end
