Rails.application.routes.draw do
  get '/locationByIp', to: 'search#show'
end
