Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  get 'home/index'

#profile if user exists
#  get '/signedinuserprofile' => 'profiles#signedinuserprofile'

  #logs user out
  get '/users/sign_out' => 'devise/sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root fot the index page
  root 'home#index'
end

Rails.application.routes.draw do
  resources :profiles
  get 'home/index'


  resources :books

  root 'home#index'
end

Rails.application.routes.draw do
  resources :profiles
  get 'home/index'


  resources :magazines

  root  'home#index'
end
