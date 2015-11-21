class UsersController < ApplicationController
	def index
    @current_user = current_user
    User.find_each(&:save)
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
      @current_user = current_user
      @url = 'http://www.google.com'

      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome email after save
          UserMailer.welcome_email(@user).deliver_now 

          format.html { redirect_to(@current_user, notice: 'User was successfully created.') }
          format.json { render json: @current_user, status: :created, location: @current_user }
        else
          format.html { render action: 'new' }
          format.json { render json: @current_user.errors, status: :unprocessable_entity }
        end
      end
     # <-- go to show
  end
  def show
     @current_user = current_user
     @user = User.friendly.find(params[:id])
     @recipients= @user.recipients
     @recipient = Recipient.new 
     render :show
 end
end
