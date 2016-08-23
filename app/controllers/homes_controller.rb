class HomesController < ApplicationController
  
  def index
  end

  def how_it_works
  end
  def our_story
    
  end
  def vanues_map
    
  end
  def blog
    @blogs  = Blog.all.page(params[:page]).per(2)
    @search = @blogs.ransack(params[:q])
    @blogs = @search.result
  end
  def comment
    @blog=Blog.find(params[:blog_id])
    @comment=@blog.comments.create(param_comment)
    @count = @blog.comments.count
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

  private
  def param_comment
    params.require(:comment).permit(:content)
  end
end
