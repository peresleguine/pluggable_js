Dummy::Application.routes.draw do
  root 'pluggable_js/posts#index'

  namespace :pluggable_js do
    resources :posts, only: [:index, :new] do
      collection do
        get  :search
      end
    end
  end  

end
