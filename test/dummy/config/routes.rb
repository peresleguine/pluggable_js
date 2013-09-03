Dummy::Application.routes.draw do
  resources :posts, only: [:index, :new]
end
