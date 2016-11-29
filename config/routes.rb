Rails.application.routes.draw do
  get 'general/index'
  get 'export/:id', to: 'general#export_to_pdf', as: :export_to_pdf

  root 'general#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
