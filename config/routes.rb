Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    resources :users do
        resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end

end
