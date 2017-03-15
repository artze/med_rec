Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    resources :users do
        resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end

get "/sign_in" => "clearance/sessions#new", as: "sign_in"
delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
get "/sign_up" => "clearance/users#new", as: "sign_up"

	resources :patients  do 
 		resources :medical_records,
 		only: [:index, :show]
 	end 

 	resources :doctors do
 		get "/medical_records/patient_input", to: 'medical_records#patient_input', as: 'MR_patient_input'
 		post "/medical_records/patient_input", to: 'medical_records#patient_submit', as: 'MR_patient_submit'
 		get "/medical_records/input", to: 'medical_records#record_input', as: 'MR_input'
 		post "/medical_records/input", to: 'medical_records#record_submit', as: 'MR_submit'
 		get "/medical_records/medication_input", to: 'medications#medications_input', as: 'medications_input'
 		post "/medical_records/medication_input", to: 'medications#medications_submit', as: 'medications_submit'
    get '/appointment/patient_input', to: 'appointments#patient_input', as: 'appointment_patient_input'
    post '/appointment/patient_input', to: 'appointments#patient_submit', as: 'appointment_patient_submit'
    get '/appointment/patient_medical_records', to: 'appointments#medical_record_index', as: 'appointment_patient_medical_records'
 	end 

 	resources :medical_records, only: [] do
    get 'appointment/new', to: 'appointments#new', as: 'new_appointment'
    post '/appointment', to: 'appointments#create', as: 'appointment'
 	end
end
