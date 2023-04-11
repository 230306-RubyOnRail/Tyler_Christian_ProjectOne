Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/reimbursement/:user_id', to: 'reimbursements#index'
  get '/reimbursement-manager/:manager_id', to: 'reimbursements#indexM'
  post '/login', to: 'sessions#create'
  post '/submit', to: 'reimbursements#create' 
  put '/reimbursements/:reimbursement_id', to: 'reimbursements#update'
  get '/myThing', to: 'sessions#myTest'
  #resources :reimbursements , params: ["reimbursement_id"]

  # Defines the root path route ("/")
  # root "articles#index"
end
