Rails.application.routes.draw do
  devise_for :user,
    controllers: { omniauth_callbacks: 'authentication' }

  devise_scope :user do
    delete '/logout', to: 'authentication#logout'
  end

  root 'home#index'
end
