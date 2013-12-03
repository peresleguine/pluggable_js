Dummy::Application.routes.draw do
  resources :posts, only: [:index, :new] do
    collection do
      get  :search
    end
  end
end
