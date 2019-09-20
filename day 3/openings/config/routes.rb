Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/recommended', to: 'home#recommended', as: 'recommended_ideas'
end
