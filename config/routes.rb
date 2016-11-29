Rails.application.routes.draw do
  get 'general/index'

  root 'general#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
