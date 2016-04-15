class HomesController < ApplicationController
  
  def index
  end

  def how_it_works
  end

  def privacy_policy
  end
  
  def terms_conditions
  end

  def app_user_confirmation
   	@user = User.find_by_confirmation_token(params[:confirmation_token])
   	if @user.present?
      @user.update_attributes(confirmation_token: nil ,confirmed_at: Time.now.utc)
      m =  "Your account activated successfully, Please go to the app and press login to use the app." 
    else
      m = "Your account already Activated, Please go to the app and press login to use the app."
    end
    redirect_to how_it_works_path, notice: m
 	end
end
