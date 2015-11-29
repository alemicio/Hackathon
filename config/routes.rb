Rails.application.routes.draw do

  devise_for :users
  root :to => "home#index"

  get "home/contact" => "home#contact"
  get "home/index" => "home#index"
  get "home/info" => "home#info"

  resources :rail_stations
  resources :metro_stations
  resources :urban_lines
end
