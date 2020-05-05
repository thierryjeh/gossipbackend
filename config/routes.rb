Rails.application.routes.draw do
  resources :gossips
  root 'gossips#index'#ma page d'accueil renvoie vers l'URL index (fichier index.html.erb)
  get 'gossips/show'#ici et pour les suivant, on indique la route à appliquer en fonction de ce qui sort du controller
  get 'gossips/new'
  get 'gossips/edit'
end
