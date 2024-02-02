Rails.application.routes.draw do
  get 'materials/update'
  get 'materials/destroy'


  resources :tutorials, param: :address do
    resources :materials
    resources :external_links
  end

  resources :tutorials, :path => 'blogs/', param: :address do
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
  get 'dashboard/all'


  root "topics#index"
end
