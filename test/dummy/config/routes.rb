Dummy::Application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :new] do
    collection do
      get  :search
    end
  end
end
