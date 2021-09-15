Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'registration', controllers:
    {
      registrations: 'registrations',
      confirmations: 'confirmations',
      sessions: 'sessions'
    }

  mount ActionCable.server => "/cable"

  scope :api, defaults: { format: :json } do
    resources :topics, only: [:index]
    resources :targets, only: [:create, :index, :destroy]
    resources :conversations, only: [:index]
    resources :messages, only: [:create, :index]
  end
end
