Rails.application.routes.draw do
  
  get '/dashboard' => 'welcome#dashboard'
  root to: 'welcome#index'

  namespace :api do
    resources :shares
  end

  scope '/api' do
  devise_for :users,
    :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks",
      registrations: "users/registrations"
  }
  end

  devise_scope :user do
    get '/api/current_user' => 'users/sessions#show_current_user', as: "show_current_user"
    post '/api/check/is_user' => 'users/users#is_user', as: 'is_user'
  end
end
