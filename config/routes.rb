Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'registration', controllers: {registrations: "registrations"}
 
  scope :api, defaults: { format: :json } do
    resources :topics
  end
end
