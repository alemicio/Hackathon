Rails.application.routes.draw do

  devise_for :users
  root :to => "home#index"

  resources :rail_stations
  resources :metro_stations
  resources :urban_lines
end
