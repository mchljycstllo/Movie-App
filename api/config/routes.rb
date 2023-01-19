Rails.application.routes.draw do
  namespace 'api' do
    get 'test-route' => 'dummy#test'
    
    scope '/cms' do
      resources :genre
    end

    scope '/user' do
      #
    end
  end
end
