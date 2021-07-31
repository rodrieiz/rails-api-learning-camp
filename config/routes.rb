Rails.application.routes.draw do
  resources :topics
  mount_devise_token_auth_for 'User', at: 'registration', controllers: {registrations: "registrations"}

  scope :api, defaults: { format: :json} do
    
  end
end
