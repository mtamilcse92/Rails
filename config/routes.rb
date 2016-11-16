Rails.application.routes.draw do
  resources :projects, only: [:create, :show] do
    resources :project_steps, only: [:edit, :update]
  end

  resources :projects
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "register_schools#index"
  resources :register_schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
