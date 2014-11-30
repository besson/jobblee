Rails.application.routes.draw do
  root to: "bubbles#index"
  resources :bubbles
  get "/map/bubbles", to: "bubbles#map"
end
