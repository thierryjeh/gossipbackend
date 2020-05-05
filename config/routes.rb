Rails.application.routes.draw do
  get 'user/user_description'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:first_name', to: 'welcome#user'
  get '/', to: 'home#index'
  get '/gossip/:id', to: 'gossip#index', as: 'gossip_id'
  get '/user/:user_id', to: 'user#user_description', as: 'user_description'
end
