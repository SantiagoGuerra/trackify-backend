Rails.application.routes.draw do
  post 'v1/signup', to: 'users#create'
  post 'v1/login', to: 'authentication#login'
end
