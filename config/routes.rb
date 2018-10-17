Rails.application.routes.draw do
  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
  root 'static_pages#home'

  scope '/about' do
    get '/ncfa', to: 'static_pages#about_ncfa', as: 'about_ncfa'
    get '/aerm', to: 'static_pages#about_aerm', as: 'about_aerm'
  end

  get '/methodology', to: 'static_pages#methodology'
  get '/collection', to: 'static_pages#collection'
  get '/limitations', to: 'static_pages#limitations'
  get '/ratings', to: 'static_pages#ratings'

  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/sectors', to: 'static_pages#sectors', as: 'sectors'

  namespace :api do 
    get '/explore/services', to: 'explore#services'
    get '/explore/assets', to: 'explore#assets'
    get '/explore/sectors', to: 'explore#sectors'
  end
  scope '/data' do

    resources :ecosystem_services, only: [:index, :show]
    resources :assets, only: [:index, :show]
    resources :drivers, only: [:index, :show]
  end
end
