Rails.application.routes.draw do
  resources :quizzes
  devise_for :users
  root 'questions#index'

  resources :questions do

  end
end

