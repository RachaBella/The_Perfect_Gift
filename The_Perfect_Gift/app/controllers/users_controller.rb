class UsersController < ApplicationController
	def index
    @current_user = current_user
		@users = User.all
		render :index 
	end 

	def new
      @current_user = current_user
	    @user = User.new
	    render :new
  	end

  	def create
    	user_params = params.require(:user).permit(:username, :email, :password)
    	@user = User.create(user_params)
	    login(@user) # <-- login the user
	    redirect_to "/users/#{@user.id}" # <-- go to show
    end

    def show
    	@current_user = current_user
    	@user = User.friendly.find(params[:id])
    	render :show
  	end
end
