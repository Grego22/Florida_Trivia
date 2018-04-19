Rails.application.routes.draw do
  root 'questions#new'

  resources :questions do

  end
end

