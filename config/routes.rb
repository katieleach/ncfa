Rails.application.routes.draw do

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


  scope '/data' do

    resources :ecosystem_services, only: [:index, :show]
    resources :assets, only: [:index, :show]
    resources :drivers, only: [:index, :show]
  end
end
