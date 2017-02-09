Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'profiles#character_sheets'
    end

    unauthenticated do
      root 'general#index'
    end
  end

  get 'general/index'

  resources :character_sheets do
    get :export, on: :member
    post :export, on: :collection
    get 'fate', on: :new
    get 'gurps', on: :new
    get 'hero_quest', on: :new
    get 'fae', on: :new
  end

  resource :profile, only: [:show] do
    get :character_sheets, on: :collection
  end

  resources :shareable_links, only: [:show, :create, :destroy], param: :token

  get 'general/about'
  get 'general/faq'

  get '*path', to: 'application#not_found'
end
