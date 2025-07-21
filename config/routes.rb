Rails.application.routes.draw do
  get '/homes/about'  => 'homes#About', as: 'about'
  devise_for :users
  root to: "homes#top"
end
