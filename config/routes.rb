Rails.application.routes.draw do
  # get 'quetions/show'
  # get 'quetions/new'
  # get 'quetions/edit'

  root 'questions#index'
  resources :questions do
    resources :answers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
