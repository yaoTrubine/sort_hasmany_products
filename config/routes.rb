Rails.application.routes.draw do
  get 'sorts/new'

  get 'products/index'

    root 'staticpages#home'
    get '/intro', to: "staticpages#intro"
    get '/allproduct', to: "staticpages#product"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    scope '/admin' do
      resources :sorts do
        resources :products
      end
      resources :orders
    end
end
