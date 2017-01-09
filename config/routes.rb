Rails.application.routes.draw do
  get 'general/index'
  # get 'export/:id', to: 'general#export_to_pdf', as: :export_to_pdf

  resources :character_sheets do
    get :export, on: :member
    get 'fate', on: :new
    get 'gurps', on: :new
    get 'hero_quest', on: :new
  end

  root 'general#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
