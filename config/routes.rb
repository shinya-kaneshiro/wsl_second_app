Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root 'home#index'

  devise_scope :user do
    # ログイン後のリダイレクト先をデフォルトのルートURLから変更したので、新たにログイン画面をルートに設定。
    root 'users/sessions#new'
    # get 'users/index', to: 'users/registrations#index'
    # get 'users/destroy', to: 'users/sessions#destroy'
  end 
  namespace :users do
    get 'dash_boards/index'
  end

  namespace :users do
    # resource :articles
    get 'articles/index'
    get 'articles/show'
    get 'articles/new'
    post 'articles/create'
    get 'articles/edit'
    patch 'articles/update'
    delete 'articles/destroy'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
