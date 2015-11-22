class RecipientsController < ApplicationController
	
	def index
		@recipients = User.find(params[:user_id]).recipients
		p @recipients
		if request.xhr?
        render :json => {
                            :recipients => @recipients
                        }
     end
	end

	def new
		@recipient = Recipient.new
	end

	def create
		p params
		@current_user = current_user
		@recipient = Recipient.create(params.require(:recipient).permit(:name, :email))
		if @recipient.save
			p  "saved"
			@current_user.recipients << @recipient
			@recipients = @current_user.recipients
			render :json => {
                            :recipients => @recipients
                        }
		else
			redirect_to root_path
		end

	end


	private
	def recipients_param
		params.require(:recipient).permit(:name, :email)
	end
end
