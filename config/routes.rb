Rails.application.routes.draw do
  
  get 'pages/index' # path
  root 'pages#index' # controller#action
  get 'pages/help' # path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
