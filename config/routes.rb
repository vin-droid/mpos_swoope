Rails.application.routes.draw do
  
 




  get 'vanues/show'
  get 'vanues/vanue_map'

  #Statis Pages routes
  root 'homes#index'
  get '/index' => 'homes#index'
  get '/how_it_works' => "homes#how_it_works"
  get '/our_story' => "homes#our_story"
###########################   VANUE CONTROLLER #######################
  get '/vanues' => "vanues#index"
  get '/vanues_details' => 'vanues#vanues_details'
  get '/vanues_map' => 'vanues#vanues_map'
###########################   BLOG CONTROLLER  #######################  

  get '/blog' => "homes#blog"
  post '/comment/:blog_id'=>'homes#comment' , as: :comment
  get '/privacy_policy' =>  "homes#privacy_policy"
  get '/terms_conditions' => "homes#terms_conditions"
  get '/app_user_confirmation/:confirmation_token' => "homes#app_user_confirmation" 

end

