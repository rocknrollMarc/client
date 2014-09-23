Rails.application.routes.draw do
 scope '/api' do
   resources :shares

   devise_for :users,
     :controllers => {
      omniauth_callbacks: "users/omniauth_callbacks",
      registrations: "users/registrations",
      sessions: "users/sessions"
   }
 end

 get '/dashboard' => 'welcome#dashboard'
 root to: 'welcome#index'

end
