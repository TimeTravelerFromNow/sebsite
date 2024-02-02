Rails.application.routes.draw do
  get 'materials/update'
  get 'materials/destroy'

  resources :blogs, param: :address do
    resources :materials
    resources :external_links
  end


  resources :tutorials, param: :address do
    resources :materials
    resources :external_links
  end

  resources :topics, :path => '/', param: :title do
    resources :external_links
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get 'dashboard/root'
  get 'dashboard/blogs'
  get 'dashboard/tutorials'

  root "topics#index"
end
