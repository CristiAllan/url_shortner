Rails.application.routes.draw do
  resources :urls, only: %i[index show create update]
end
