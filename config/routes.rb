Rails.application.routes.draw do
  
  #Statis Pages routes
  root 'homes#index'
  get '/index' => 'homes#index'
  get '/how_it_works' => "homes#how_it_works"
  get '/privacy_policy' =>  "homes#privacy_policy"
  get '/terms_conditions' => "homes#terms_conditions"
  get '/app_user_confirmation/:confirmation_token' => "homes#app_user_confirmation" 

end
