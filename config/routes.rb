Rails.application.routes.draw do
  root to: "bubbles#index"
  resources :bubbles
  resources :stats
  get "/map/bubbles", to: "bubbles#map"
  get "/chart", to: "bubbles#chart"
end
