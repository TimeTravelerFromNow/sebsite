Rails.application.routes.draw do
  resources :abouts
  get 'materials/update'
  get 'materials/destroy'


  resources :tutorials, param: :address do
    resources :materials
    resources :external_links
  end

  get 'tutorials/edit_links/:address' => 'tutorials#edit_links', as: :edit_links

  resources :tutorials, :path => '/blogs', param: :address do
    resources :materials
    resources :external_links
  end

  get 'blogs/' => "blogs#index"
  get 'blogs/:address' => "tutorials#show", as: :blog

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
